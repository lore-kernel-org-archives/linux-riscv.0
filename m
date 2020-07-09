Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 983EEC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 06:22:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6434A20663
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 06:22:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USZDHjso";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFYPCKMh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6434A20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oaT56010m/WVF1a/8eE6C6UDAWZgyfGo0lv1RdQBhFs=; b=USZDHjsoM5pL7AJ1H06mEX5mL
	MQh6yJ2CVmqtGKmNHIJfz5lWEvCLZWJB5JU7d2ZR4gefkhjxHmbUAWroVloBr3JmVl4TD4ZWjBQJb
	UFwZ52eEz443yeNOyiFZrspwGCy1QTLP3mY33MDpzwLbrcDH+1Lm20l6mdn/7eOvK5XS+GdSrbxNu
	6TyVz5CCdk+cDLBzF9PhwKoHVjALDhf6fQsq4eMN5NGhYkz385Y8pZ+gggwD9j0exi+yutmCJvqGg
	zmmFT4XJtkJcEBHWTdqA++0mpl66WNy9m+eJgbybfDMp4Mt4IOuKahAw56oJOl6ZSCv3E769OGmO4
	POxyf7M9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtPwo-0005FM-2Y; Thu, 09 Jul 2020 06:22:18 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtPwm-0005Ex-0Y
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 06:22:16 +0000
Received: by mail-wm1-x343.google.com with SMTP id g75so598396wme.5
 for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2020 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gFF6cRXPZWxd7Qpi0omO8g63vjK0Tifq+qnvPaoGQN4=;
 b=EFYPCKMh/gdOpn8FHMjdfuEIXN6C/VRooCUlnoWy59ORywMooLDtxp+BS7BoIgt0G1
 jmrm8e7JcbBuj9cZR3MvdgZ/nonjZvh7ddEjA+S3wAUi26hnRbCuN/ez9fiSlVKAUem7
 Zj9KcE3DNCGeJImAGqdqCrHddS3WRSYPSauF1ZZKRzkXUJcJb9PqZEVdSCu8GamZHjB9
 GRjHrTD5x1gTsftRjSH6nFTSc9cG3ue/tbdj4cd6RH6yMlWiZ18gsHMbqf2/EWid4yXC
 2JJS6ueLMq/w2U/VS0fjhIB22AHdpqALU1/hRFInm7PLwzxS5UczZg+/OyavlaGG9DnR
 Op8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gFF6cRXPZWxd7Qpi0omO8g63vjK0Tifq+qnvPaoGQN4=;
 b=Yl28bSR/mzCpwT6I5N/lQcNPRfEjA/GNsiqcCFiZh0pxPXTDuONzFn9E2R2WmRZGj7
 xyj/CCN73X84r/5KoJGou6G7kOz8kV63rkvDTTT3i1D1t4t2sn8HBx6c3aV6iPvcv98p
 TOTMmw7X2mMin/SbpwdPSujAzvZBAjysoUf3luh5HE/Ng0OeQGsfc0W+5ktN+W1tEimB
 BEPWN/YZ0H357QACl/wJ1qEXHdKLwgE/zeX0X0PuJiMvqd8sUqSFW5gBH+GB324+naxh
 qzdcxe1dauAzg2WGpJFyY97vB5DRPqzmrfEvUOs4tXRk54sHVk0/rtG1ASzUtjJKzdnK
 PAuQ==
X-Gm-Message-State: AOAM53272H74CyXdieO4oKdurvo2mxXBqCHq/3UsVctm6hcWeXrvJy6E
 zMA35g3MhyIKs2nIdAjlHPXuqoMxT9JcoAlaoqaZCwM0uOQ=
X-Google-Smtp-Source: ABdhPJw/PQAQz5vRvxXyLsZvKJpX4qH/jBi9iuTgfDOZNLsLiG9CWKsZ0zqUihapgZiMYjxfURhGOGLuZm/C0OD0nwQ=
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr13313090wmb.56.1594275734854; 
 Wed, 08 Jul 2020 23:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200708210948.34197-1-kernel@esmil.dk>
In-Reply-To: <20200708210948.34197-1-kernel@esmil.dk>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Thu, 9 Jul 2020 08:22:03 +0200
Message-ID: <CAJ+HfNj+dFE70O49-wZC1ckGSVo8Fb4_UcaeZocQABfKkyHmSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: Support R_RISCV_ADD64 and R_RISCV_SUB64
 relocs
To: Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_022216_107454_E33239F6 
X-CRM114-Status: GOOD (  16.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA4IEp1bCAyMDIwIGF0IDIzOjEwLCBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVs
QGVzbWlsLmRrPiB3cm90ZToKPgo+IFRoZXNlIGFyZSBuZWVkZWQgZm9yIHRoZSBfX2p1bXBfdGFi
bGUgaW4gbW9kdWxlcyB1c2luZwo+IHN0YXRpYyBrZXlzL2p1bXAtbGFiZWxzIHdpdGggdGhlIGxh
eW91dCBmcm9tCj4gSEFWRV9BUkNIX0pVTVBfTEFCRUxfUkVMQVRJVkUgb24gNjRiaXQga2VybmVs
cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwu
ZGs+CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAZ21haWwuY29tPgpU
ZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRvcGVsQGdtYWlsLmNvbT4KCj4gLS0tCj4K
PiBUZXN0ZWQgb24gdGhlIEhpRml2ZSBVbmxlYXNoZWQgYm9hcmQuCj4KPiBUaGlzIHBhdGNoIGlz
IG5ldyBpbiB2Mi4gSXQgZml4ZXMgYW4gZXJyb3IgbG9hZGluZyBtb2R1bGVzCj4gY29udGFpbmlu
ZyBzdGF0aWMga2V5cyBmb3VuZCBieSBCasO2cm4gVMO2cGVsLgo+Cj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL21vZHVsZS5jIHwgMTYgKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvbW9kdWxlLmMKPiBpbmRleCA3MTkxMzQyYzU0ZGEuLjEwNGZi
YTg4OWNmNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9tb2R1bGUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL21vZHVsZS5jCj4gQEAgLTI2Myw2ICsyNjMsMTMgQEAgc3RhdGlj
IGludCBhcHBseV9yX3Jpc2N2X2FkZDMyX3JlbGEoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9j
YXRpb24sCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gK3N0YXRpYyBpbnQgYXBwbHlfcl9y
aXNjdl9hZGQ2NF9yZWxhKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0aW9uLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVsZl9BZGRyIHYpCj4gK3sKPiArICAgICAg
ICoodTY0ICopbG9jYXRpb24gKz0gKHU2NCl2Owo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gIHN0YXRpYyBpbnQgYXBwbHlfcl9yaXNjdl9zdWIzMl9yZWxhKHN0cnVjdCBtb2R1bGUgKm1l
LCB1MzIgKmxvY2F0aW9uLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEVs
Zl9BZGRyIHYpCj4gIHsKPiBAQCAtMjcwLDYgKzI3NywxMyBAQCBzdGF0aWMgaW50IGFwcGx5X3Jf
cmlzY3Zfc3ViMzJfcmVsYShzdHJ1Y3QgbW9kdWxlICptZSwgdTMyICpsb2NhdGlvbiwKPiAgICAg
ICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBhcHBseV9yX3Jpc2N2X3N1YjY0X3Jl
bGEoc3RydWN0IG1vZHVsZSAqbWUsIHUzMiAqbG9jYXRpb24sCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRWxmX0FkZHIgdikKPiArewo+ICsgICAgICAgKih1NjQgKilsb2Nh
dGlvbiAtPSAodTY0KXY7Cj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGlu
dCAoKnJlbG9jX2hhbmRsZXJzX3JlbGFbXSkgKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0
aW9uLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRWxmX0FkZHIgdikgPSB7Cj4g
ICAgICAgICBbUl9SSVNDVl8zMl0gICAgICAgICAgICAgICAgICAgID0gYXBwbHlfcl9yaXNjdl8z
Ml9yZWxhLAo+IEBAIC0yOTAsNyArMzA0LDkgQEAgc3RhdGljIGludCAoKnJlbG9jX2hhbmRsZXJz
X3JlbGFbXSkgKHN0cnVjdCBtb2R1bGUgKm1lLCB1MzIgKmxvY2F0aW9uLAo+ICAgICAgICAgW1Jf
UklTQ1ZfUkVMQVhdICAgICAgICAgICAgICAgICA9IGFwcGx5X3JfcmlzY3ZfcmVsYXhfcmVsYSwK
PiAgICAgICAgIFtSX1JJU0NWX0FMSUdOXSAgICAgICAgICAgICAgICAgPSBhcHBseV9yX3Jpc2N2
X2FsaWduX3JlbGEsCj4gICAgICAgICBbUl9SSVNDVl9BREQzMl0gICAgICAgICAgICAgICAgID0g
YXBwbHlfcl9yaXNjdl9hZGQzMl9yZWxhLAo+ICsgICAgICAgW1JfUklTQ1ZfQURENjRdICAgICAg
ICAgICAgICAgICA9IGFwcGx5X3JfcmlzY3ZfYWRkNjRfcmVsYSwKPiAgICAgICAgIFtSX1JJU0NW
X1NVQjMyXSAgICAgICAgICAgICAgICAgPSBhcHBseV9yX3Jpc2N2X3N1YjMyX3JlbGEsCj4gKyAg
ICAgICBbUl9SSVNDVl9TVUI2NF0gICAgICAgICAgICAgICAgID0gYXBwbHlfcl9yaXNjdl9zdWI2
NF9yZWxhLAo+ICB9Owo+Cj4gIGludCBhcHBseV9yZWxvY2F0ZV9hZGQoRWxmX1NoZHIgKnNlY2hk
cnMsIGNvbnN0IGNoYXIgKnN0cnRhYiwKPiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
