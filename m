Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB11C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwXl6Tzyf79NcBiZH1wPpmNxNKMnfHyZp0FGPvwq8Gw=; b=IW4RwabKTZVcZg
	JCZumnpb22ZW4ROxYj8q9AYmbdFlQTQV9Dk0O76FyiqrV3tI61/ZS6qfYTVIs0bhZtsoL7J3fmzIy
	scSubDWLlNX2Fks2ojL7QQwn6yz4q9TaTvGukFtn1A8KTP/vHb7vOi+zKRjLy1oCjx5h6RuEJMWma
	uptz82e90ze6qalhcVh3iO2saIVn5AeEV2X208OP8RJ9yz/3SDpzS/pqISsdQEWsLGD86C0DdH71R
	8I7m0Qx5X4drqLy/XwgVvqMU3H66+V4yWudT20vJjmSkR6l95deAeEMmy8jm7N0QkGdkFySN1AzpP
	39L61r9C3vRBKGfAUd2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t4S-0000000GAOj-3sZe;
	Tue, 14 May 2024 14:24:00 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t4O-0000000GALC-15Aj
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 14:23:58 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36c72dbed20so24216705ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 07:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715696633; x=1716301433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YWn5jiV2rbv9bUfRPQn5PpR5vLXDPL+5w2PCpg75zY=;
        b=ayFV091ISbpxaEjdIlqJ3Iz7GbaJ5uZOIfQPToxBQMrA2r/Bsj7FrNojLYne2773yN
         XdGG+V6V7IRi79IPxUl1y7rXZ+Vtidm0xGVeB+pEA0dEeztF0+M4+mYjUCBDskXpxCMn
         EG6nDIt9xyCEqoHE3wFJJe2j229N6j7TXAR1NcrQfNXV/JogSJrgkG0TbCfbqab19D/O
         RcLwDXrUpg4iQ1VTUzzKNmW2IoXP/W8c3PMZnTjNKhYsShkZheNvk8Ffcz2cFo6deogo
         QyTKoWcVs88/e1rPRAUWcy5Hrf/bz8dO1MwLMHK3wuSVO2egpYwPcLT2PnR5FK6GtQOm
         n26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715696633; x=1716301433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9YWn5jiV2rbv9bUfRPQn5PpR5vLXDPL+5w2PCpg75zY=;
        b=bNDJoRbfGnkuBkuJPbxAhHXhwQXe0gj8rX+UjxwtWhsqBa6hSgbppgx2ych5gZlHBF
         20kMgvB0jZWmwxOa9tKyRHFW1yvsPvxvZdBCYjVDpkP3iWgHqrlo70rsqg63guQ0RrUU
         mTi0Z4XXf0bRatYeLwfWN4A22xLUenf6N2KifsjH0enx7Svj7q4ZN9QlPFsdsl3r/Rk+
         Ush3kYiypuCiA/vX4Rz0K3XXNs6XKCz4aL+rzYJKWsqhX7VCU+IoVzUHKCl6VgcRwF2/
         VwMreuTaYNaJMPBTsjHHZ84ZNTvMcAf6sNaG75Db0d4rhxJvM0rvPmhNs7XN/q6JJy3t
         N62w==
X-Forwarded-Encrypted: i=1; AJvYcCUP7+j5kxAm937ThSoMXPhYIvREjoijKnvKQz819Xe8K823GjXJAePedWQenCWcDYNHcrO0+2pyrKBdAZw0Pv4taAPBHtXODCPudVcLRMSf
X-Gm-Message-State: AOJu0YzyKeNyWx0nEylRbQoGCUZY4qQb4nLzqieEbP23fQwsImauey5h
	nB8hs62QSIgijKX+OiulQ3UO0jSaDVEl4TRbRl5AuAHjH8ctdqDjWKTZNPbsac5rXAl3HIrKuUQ
	XHxvUwECUEwLDB0fuIej9Nc5Mh55JoEL3bpHLNg==
X-Google-Smtp-Source: AGHT+IENHPgioCtyM7FQlXlQjrWZgq2dBdxVmW4+FCsDRQU7f9qoVwX+EnLVyxiIZV6uiDPiZpVti8QA6Ck39cfMdCc=
X-Received: by 2002:a05:6e02:1a46:b0:36d:ae10:3f83 with SMTP id
 e9e14a558f8ab-36dae103fe3mr21276645ab.11.1715696632801; Tue, 14 May 2024
 07:23:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240226065113.1690534-1-nick.hu@sifive.com> <CAPDyKFph3WsZMmALnzBQKE4S_80Ji5h386Wi0vHda37QUsjMtg@mail.gmail.com>
 <CAKddAkDcdaXKzpcKN=LCCx9S4Trv+joLX2s=nyhzaRtM5HorqA@mail.gmail.com>
 <CAKddAkC6N=Cfo0z+F8herKTuJzCyt_MA0vWNbLCr6CbQnj0y8g@mail.gmail.com>
 <CAPDyKFr_M0NDH0gaunBpybnALOFfz4LpX4_JW2GCUxjwGzdZsg@mail.gmail.com> <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com>
In-Reply-To: <CAKddAkC5CRX+ZTh=MgzPYU72SY13+AQYhknhV_CC+=XX9=DKyg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 May 2024 19:53:40 +0530
Message-ID: <CAAhSdy1SDd=VUqDQA0T5n9LwHo=3uGzFq1dUcbDFcB3aBdaioA@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: riscv-sbi: Add cluster_pm_enter()/exit()
To: Nick Hu <nick.hu@sifive.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, palmer@dabbelt.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, paul.walmsley@sifive.com, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_072356_549532_F4B88AA4 
X-CRM114-Status: GOOD (  43.32  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTmljaywKCk9uIFR1ZSwgTWF5IDE0LCAyMDI0IGF0IDM6MjDigK9QTSBOaWNrIEh1IDxuaWNr
Lmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgVWxmLAo+Cj4gVGhhbmsgeW91IGZvciB5b3Vy
IHZhbHVhYmxlIHN1Z2dlc3Rpb24uCj4gSSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciB0aGUgZGVs
YXkgaW4gcmVzcG9uZGluZyB0byB5b3VyIG1lc3NhZ2UuIFdlCj4gaGF2ZSBkaWxpZ2VudGx5IHdv
cmtlZCBvbiBleHBlcmltZW50aW5nIHdpdGggdGhlIHN1Z2dlc3Rpb24geW91Cj4gcHJvdmlkZWQu
Cj4KPiBBcyBwZXIgeW91ciByZWNvbW1lbmRhdGlvbiwgd2UgaGF2ZSBpbmNvcnBvcmF0ZWQgdGhl
ICJwb3dlci1kb21haW5zPTw+Cj4gcHJvcGVydHkiIGludG8gdGhlIGNvbnN1bWVyJ3Mgbm9kZSwg
cmVzdWx0aW5nIGluIG1vZGlmaWNhdGlvbnMgdG8gdGhlCj4gRFRTIGFzIGlsbHVzdHJhdGVkIGJl
bG93Ogo+Cj4gY3B1cyB7Cj4gICAgIC4uLgo+ICAgICAgZG9tYWluLWlkbGUtc3RhdGVzIHsKPiAg
ICAgICAgICAgIENMVVNURVJfU0xFRVA6Y2x1c3Rlci1zbGVlcCB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJkb21haW4taWRsZS1zdGF0ZSI7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAgfQo+ICAgICAgfQo+ICAgICAgcG93ZXItZG9t
YWlucyB7Cj4gICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAgLi4uCj4gICAgICAgICAgICAg
Q0xVU1RFUl9QRDogY2x1c3RlcnBkIHsKPiAgICAgICAgICAgICAgICAgICAgIGRvbWFpbi1pZGxl
LXN0YXRlcyA9IDwmQ0xVU1RFUl9TTEVFUD47Cj4gICAgICAgICAgICAgfTsKPiAgICAgIH0KPiB9
Cj4gc29jIHsKPiAgICAgICBkZXZpY2VBQHh4eHsKPiAgICAgICAgICAgICAgLi4uCj4gICAgICAg
ICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JkNMVVNURVJfUEQ+Owo+ICAgICAgICAgICAgICAuLi4K
PiAgICAgICB9Cj4gfQo+Cj4gSG93ZXZlciwgdGhpcyBhZGp1c3RtZW50IGhhcyBsZWQgdG8gYW4g
aXNzdWUgd2hlcmUgdGhlIHByb2JlIGZvcgo+ICdkZXZpY2VBJyBpcyBkZWZlcnJlZCBieSAnZGV2
aWNlX2xpbmtzX2NoZWNrX3N1cHBsaWVycygpJyB3aXRoaW4KPiAncmVhbGx5X3Byb2JlKCknLiBJ
biBhbiBhdHRlbXB0IHRvIG1pdGlnYXRlIHRoaXMgaXNzdWUsIHdlCj4gZXhwZXJpbWVudGVkIHdp
dGggYSB3b3JrYXJvdW5kIGJ5IGFkZGluZyB0aGUgYXR0cmlidXRlCj4gInN0YXR1cz0iZGlzYWJs
ZWQiIiB0byB0aGUgJ0NMVVNURVJfUEQnIG5vZGUuIFRoaXMgYWN0aW9uIGFpbWVkIHRvCj4gcHJl
dmVudCB0aGUgY3JlYXRpb24gb2YgYSBkZXZpY2UgbGluayBiZXR3ZWVuICdkZXZpY2VBJyBhbmQK
PiAnQ0xVU1RFUl9QRCcuIE5ldmVydGhlbGVzcywgd2UgcmVtYWluIHVuY2VydGFpbiBhYm91dCB0
aGUKPiBhcHByb3ByaWF0ZW5lc3Mgb2YgdGhpcyBzb2x1dGlvbi4KPgo+IERvIHlvdSBoYXZlIHN1
Z2dlc3Rpb25zIG9uIGhvdyB0byBlZmZlY3RpdmVseSBhZGRyZXNzIHRoaXMgaXNzdWU/CgpJIHRv
dGFsbHkgbWlzc2VkIHRoaXMgZW1haWwgc2luY2UgSSB3YXMgbm90IENDJ2VkIHNvcnJ5IGFib3V0
IHRoYXQuIFBsZWFzZQp1c2UgZ2V0X21haW50YWluZXJzLnBsIHdoZW4gc2VuZGluZyBwYXRjaGVz
LgoKVGhlIGdlbnBkX2FkZF9wcm92aWRlcigpIChjYWxsZWQgYnkgb2ZfZ2VucGRfYWRkX3Byb3Zp
ZGVyX3NpbXBsZSgpKQpkb2VzIG1hcmsgdGhlIHBvd2VyLWRvbWFpbiBEVCBub2RlIGFzIGluaXRp
YWxpemVkIChmd25vZGVfZGV2X2luaXRpYWxpemVkKCkpCnNvIGFmdGVyIHRoZSBjcHVpZGxlLXJp
c2N2LXNiaSBkcml2ZXIgaXMgcHJvYmVkIHRoZSAnZGV2aWNlQScgZGVwZW5kZW5jeSBpcwpyZXNv
bHZlZCBhbmQgJ2RldmljZUEnIHNob3VsZCBiZSBwcm9iZWQgdW5sZXNzIHRoZXJlIGFyZSBvdGhl
ciB1bm1ldApkZXBlbmRlbmNpZXMuCgpUcnkgYWRkaW5nICIjZGVmaW5lIERFQlVHIiBiZWZvcmUg
YWxsIGluY2x1ZGVzIGluIGRyaXZlcnMvY29yZS9iYXNlLmMKYW5kIGFkZCAibG9nbGV2ZWw9OCIg
aW4ga2VybmVsIHBhcmFtZXRlcnMsIHRoaXMgd2lsbCBwcmludCBwcm9kdWNlci1jb25zdW1lcgps
aW5rYWdlIG9mIGFsbCBkZXZpY2VzLgoKTWFya2luZyB0aGUgcG93ZXItZG9tYWluIERUIG5vZGUg
YXMgImRpc2FibGVkIiBpcyBjZXJ0YWlubHkgbm90IHRoZQpyaWdodCB3YXkuCgpSZWdhcmRzLApB
bnVwCgo+Cj4gUmVnYXJkcywKPiBOaWNrCj4KPiBPbiBUdWUsIEFwciAzMCwgMjAyNCBhdCA0OjEz
4oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+
IE9uIE1vbiwgMjkgQXByIDIwMjQgYXQgMTg6MjYsIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFR1ZSwgQXByIDMwLCAyMDI0IGF0IDEyOjIy4oCvQU0g
TmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEhpIFVs
Zgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBBcHIgMjksIDIwMjQgYXQgMTA6MzLigK9QTSBVbGYg
SGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gT24gTW9uLCAyNiBGZWIgMjAyNCBhdCAwNzo1MSwgTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gV2hlbiB0aGUgY3B1cyBpbiB0aGUg
c2FtZSBjbHVzdGVyIGFyZSBhbGwgaW4gdGhlIGlkbGUgc3RhdGUsIHRoZSBrZXJuZWwKPiA+ID4g
PiA+ID4gbWlnaHQgcHV0IHRoZSBjbHVzdGVyIGludG8gYSBkZWVwZXIgbG93IHBvd2VyIHN0YXRl
LiBDYWxsIHRoZQo+ID4gPiA+ID4gPiBjbHVzdGVyX3BtX2VudGVyKCkgYmVmb3JlIGVudGVyaW5n
IHRoZSBsb3cgcG93ZXIgc3RhdGUgYW5kIGNhbGwgdGhlCj4gPiA+ID4gPiA+IGNsdXN0ZXJfcG1f
ZXhpdCgpIGFmdGVyIHRoZSBjbHVzdGVyIHdva2VuIHVwLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gSSB3YXMgbm90IGNjZWQgdGhpcyBwYXRjaCwgYnV0IG5vdGljZWQgdGhhdCB0aGlz
IHBhdGNoIGdvdCBxdWV1ZWQgdXAKPiA+ID4gPiA+IHJlY2VudGx5LiBTb3JyeSBmb3Igbm90IG5v
dGljaW5nIGVhcmxpZXIuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSWYgbm90IHRvbyBsYXRlLCBjYW4g
eW91IHBsZWFzZSBkcm9wL3JldmVydCBpdD8gV2Ugc2hvdWxkIHJlYWxseSBtb3ZlCj4gPiA+ID4g
PiBhd2F5IGZyb20gdGhlIENQVSBjbHVzdGVyIG5vdGlmaWVycy4gU2VlIG1vcmUgaW5mb3JtYXRp
b24gYmVsb3cuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGRyaXZlcnMv
Y3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKy0t
Cj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3B1aWRs
ZS9jcHVpZGxlLXJpc2N2LXNiaS5jIGIvZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2Jp
LmMKPiA+ID4gPiA+ID4gaW5kZXggZTgwOTRmYzkyNDkxLi4yOThkYzc2YTAwY2YgMTAwNjQ0Cj4g
PiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiA+
ID4gPiA+ICsrKyBiL2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gPiA+ID4g
PiA+IEBAIC0zOTQsNiArMzk0LDcgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9wZF9wb3dlcl9v
ZmYoc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpwZCkKPiA+ID4gPiA+ID4gIHsKPiA+ID4gPiA+
ID4gICAgICAgICBzdHJ1Y3QgZ2VucGRfcG93ZXJfc3RhdGUgKnN0YXRlID0gJnBkLT5zdGF0ZXNb
cGQtPnN0YXRlX2lkeF07Cj4gPiA+ID4gPiA+ICAgICAgICAgdTMyICpwZF9zdGF0ZTsKPiA+ID4g
PiA+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIGlm
ICghc3RhdGUtPmRhdGEpCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+
ID4gPiA+ID4gQEAgLTQwMSw2ICs0MDIsMTAgQEAgc3RhdGljIGludCBzYmlfY3B1aWRsZV9wZF9w
b3dlcl9vZmYoc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpwZCkKPiA+ID4gPiA+ID4gICAgICAg
ICBpZiAoIXNiaV9jcHVpZGxlX3BkX2FsbG93X2RvbWFpbl9zdGF0ZSkKPiA+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICsgICAg
ICAgcmV0ID0gY3B1X2NsdXN0ZXJfcG1fZW50ZXIoKTsKPiA+ID4gPiA+ID4gKyAgICAgICBpZiAo
cmV0KQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBSYXRoZXIgdGhhbiB1c2luZyB0aGUgQ1BVIGNsdXN0ZXIgbm90aWZpZXJzLCBjb25z
dW1lcnMgb2YgdGhlIGdlbnBkCj4gPiA+ID4gPiBjYW4gcmVnaXN0ZXIgdGhlbXNlbHZlcyB0byBy
ZWNlaXZlIGdlbnBkIG9uL29mZiBub3RpZmllcnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gSW4gb3Ro
ZXIgd29yZHMsIG5vbmUgb2YgdGhpcyBzaG91bGQgYmUgbmVlZGVkLCByaWdodD8KPiA+ID4gPiA+
Cj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZmVlZGJhY2shCj4gPiA+ID4gTWF5YmUgSSBtaXNzIHNv
bWV0aGluZywgSSdtIHdvbmRlcmluZyBhYm91dCBhIGNhc2UgbGlrZSBiZWxvdzoKPiA+ID4gPiBJ
ZiB3ZSBoYXZlIGEgc2hhcmVkIEwyIGNhY2hlIGNvbnRyb2xsZXIgaW5zaWRlIHRoZSBjcHUgY2x1
c3RlciBwb3dlcgo+ID4gPiA+IGRvbWFpbiBhbmQgd2UgYWRkIHRoaXMgY29udHJvbGxlciB0byBi
ZSBhIGNvbnN1bWVyIG9mIHRoZSBwb3dlcgo+ID4gPiA+IGRvbWFpbiwgU2hvdWxkbid0IHRoZSBn
ZW5wZCBpbnZva2UgdGhlIGRvbWFpbiBpZGxlIG9ubHkgYWZ0ZXIgdGhlCj4gPiA+ID4gc2hhcmVk
IEwyIGNhY2hlIGNvbnRyb2xsZXIgaXMgc3VzcGVuZGVkPwo+ID4gPiA+IElzIHRoZXJlIGEgd2F5
IHRoYXQgd2UgY2FuIHB1dCB0aGUgTDIgY2FjaGUgZG93biB3aGlsZSBhbGwgY3B1cyBpbiB0aGUK
PiA+ID4gPiBzYW1lIGNsdXN0ZXIgYXJlIGlkbGU/Cj4gPiA+ID4gPiBbLi4uXQo+ID4gPiBTb3Jy
eSwgSSBtYWRlIHNvbWUgbWlzdGFrZSBpbiBteSBzZWNvbmQgcXVlc3Rpb24uCj4gPiA+IFVwZGF0
ZSB0aGUgcXVlc3Rpb24gaGVyZToKPiA+ID4gSXMgdGhlcmUgYSB3YXkgdGhhdCB3ZSBjYW4gc2F2
ZSB0aGUgTDIgY2FjaGUgc3RhdGVzIHdoaWxlIGFsbCBjcHVzIGluIHRoZQo+ID4gPiBzYW1lIGNs
dXN0ZXIgYXJlIGlkbGUgYW5kIHRoZSBjbHVzdGVyIGNvdWxkIGJlIHBvd2VyZWQgZG93bj8KPiA+
Cj4gPiBJZiB0aGUgTDIgY2FjaGUgaXMgYSBjb25zdW1lciBvZiB0aGUgY2x1c3RlciwgdGhlIGNv
bnN1bWVyIGRyaXZlciBmb3IKPiA+IHRoZSBMMiBjYWNoZSBzaG91bGQgcmVnaXN0ZXIgZm9yIGdl
bnBkIG9uL29mZiBub3RpZmllcnMuCj4gPgo+ID4gVGhlIGRldmljZSByZXByZXNlbnRpbmcgdGhl
IEwyIGNhY2hlIG5lZWRzIHRvIGJlIGVuYWJsZWQgZm9yIHJ1bnRpbWUKPiA+IFBNLCB0byBiZSB0
YWtlbiBpbnRvIGFjY291bnQgY29ycmVjdGx5IGJ5IHRoZSBjbHVzdGVyIGdlbnBkLiBJbiB0aGlz
Cj4gPiBjYXNlLCB0aGUgZGV2aWNlIHNob3VsZCBtb3N0IGxpa2VseSByZW1haW4gcnVudGltZSBz
dXNwZW5kZWQsIGJ1dAo+ID4gaW5zdGVhZCByZWx5IG9uIHRoZSBnZW5wZCBvbi9vZmYgbm90aWZp
ZXJzIHRvIHVuZGVyc3RhbmQgd2hlbgo+ID4gc2F2ZS9yZXN0b3JlIG9mIHRoZSBjYWNoZSBzdGF0
ZXMgc2hvdWxkIGJlIGRvbmUuCj4gPgo+ID4gS2luZCByZWdhcmRzCj4gPiBVZmZlCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
