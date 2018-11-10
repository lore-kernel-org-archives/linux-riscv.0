Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5315EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2316120840
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 18:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECV9MnaI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qs5TpGO4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2316120840
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKFkwaG9/dgmSt6xEZKK4Y05l2rjsn2p+N2ha0iOFhM=; b=ECV9MnaIq28fYg
	cg4QO1cXjKRK6CjJlE6jTgBqSTrHjKCHvgnON5001Fu4Q0lKAR4DY4mbJXPkhMlLtso543XeW7Ch0
	lr43u1wva5jg1KMNDPcaKEp3gqC2JkCc3klHVWVoKEKt+OVIxHpexVkqQq9NKo+yZCu216L38pYz+
	/fLKinGGrGJA8k0biUNY1YG6T7xvCay8900oHTyElnfQ1DjhyqcVapV2kZR0vVibuXR+2VGXjlq3+
	bbsBLgZ8rey/mp2pCgSnp0iTxV17TFNwHBx1dfB/3Suq8w68j8yyusILA2Awo9TwMVpoAUNInlG3U
	ual+vHhvsEGaOzjyDqPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXaQ-0004nB-Bu; Sat, 10 Nov 2018 18:02:22 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXaN-0004mK-1m
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 18:02:20 +0000
Received: by mail-ed1-x544.google.com with SMTP id y10-v6so4231358edr.4
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 10:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LTnUkgL+RgD5gPSSFWdqoYwfWIOHzWlYxZMldrjWrUQ=;
 b=qs5TpGO4lDk227iH8JjHvqnD3DFgMIUU9z06I7LA9ELNx6uZEa7VmOPwTC33lVdA6x
 rXfvtrKGKi1eCaqBiHAJM5MnIvTqbhV4SYPw/s5gr2B9YFpi0oAGoFQSjfJTC1V1RKZG
 bp0ME+/JcxvHN3cVDSAMcr3OrwF5iVT4zvcc9efKvanRLnfwWciYYLreASokSQPwjbUn
 aXVLSt2O1spuTJLF86s2Hb+RU7cSxEatVl8S56yJfy7/XaSKTjhw9CqnoMBlMiSJ8nay
 8p4vE3YxC3Yb4KvC+5GhpcdGwc8IKTN+oPOr2yqrek+Q+ly7y6Z6QWpbg+VwcM9/7JGZ
 ftKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LTnUkgL+RgD5gPSSFWdqoYwfWIOHzWlYxZMldrjWrUQ=;
 b=p1eCOksXdO+cRmXAHatcPjQN1SX4VAlZpW8CmmOz0+8HNY7V7T/dcpYsS/k+CJJu2S
 b5k5FNZa9DGWZdExcPsbrh1In69pJLtcmBG4b/uL77d9jyo7T3YYvIqq4BxCGsc8XJU4
 u6VuBVXy1qeHLHj8Zt4mDJP8oheiCs49gJ49CcEOqRhBAt+9XbehpW4letdTt44UEWHa
 EDWxI4ripHo6AVAWGS9+g30UBsp5vpzMb+ZU8fzhjJ7nX46L9KTuw1BtmlLqXPam/Z6h
 VDP/WGh6GDQ949zpXxNVnWWp5AeLisodmBpUQhLitIS2ix7mnF+bF4lPOKGRNnpYOIva
 /WmA==
X-Gm-Message-State: AGRZ1gJl7Yzckhh7waME0lWMgih7YTYvEAWDlPeF6KpxslCRJUPvtPTR
 SYglk9+GjGu7h6Sh1J0E94x3B6FgeZW+riZajk8=
X-Google-Smtp-Source: AJdET5eZwe1gFh3Gi7wIvOhZSE9qv11YB/TRqSO9bJVejcrklnMCCUVgW5/kghABMBD4O7292bnHXjbIABYJLnW0vto=
X-Received: by 2002:a17:906:a295:: with SMTP id
 i21-v6mr5014432ejz.86.1541872927531; 
 Sat, 10 Nov 2018 10:02:07 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
In-Reply-To: <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
From: ron minnich <rminnich@gmail.com>
Date: Sat, 10 Nov 2018 10:01:56 -0800
Message-ID:
 <CAP6exYLbZ5yBKJduU468MwXSqA+Nm6dYKj9ig=yM9e0d64nK0g@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: mick@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_100219_146564_55DBF41B 
X-CRM114-Status: GOOD (  16.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Christoph Hellwig <hch@infradead.org>,
 Damien.LeMoal@wdc.com, Olof Johansson <olof.johansson@gmail.com>,
 alankao@andestech.com, abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 Paul Walmsley <paul.walmsley@sifive.com>, olof@lixom.net,
 Alistair.Francis@wdc.com, Luke Kenneth Casson Leighton <lkcl@lkcl.net>,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110180156.pLo4FuhfUDhFzJWrBNRUsG1Rh84Lw3ZyL_awTB3iRY0@z>

QWN0dWFsbHksIGFzIGxvbmcgYXMgdGhlIG9wdGlvbiByZW1haW5zIHRvIGxldCB0aGUga2VybmVs
IHJlcGxhY2UgdGhlClNCSSB3aXRoIHNvbWV0aGluZyBlbHNlLCBJJ20gbm90IHRoYXQgd29ycmll
ZCBhYm91dCB3aGF0IHZlbmRvcnMgcHV0CmluIGl0LiBCdXQgdGhhdCBvcHRpb24gbmVlZHMgdG8g
cmVtYWluIHRoZXJlLgpPbiBTYXQsIE5vdiAxMCwgMjAxOCBhdCA5OjU5IEFNIE5pY2sgS29zc2lm
aWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAxOC0xMS0xMCAx
OTo0NywgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4gPiBPbiBT
YXQsIE5vdiAxMCwgMjAxOCBhdCA1OjQyIFBNIE9sb2YgSm9oYW5zc29uIDxvbG9mQGxpeG9tLm5l
dD4gd3JvdGU6Cj4gPgo+ID4+IFRoZSBjYXNlIG9mIGNvbnNvbGUgaXMgaW4gdGhpcyBjYXNlIHBy
ZXR0eSBzaW1wbGU6IEl0J3MgaW50ZW5kZWQgZm9yCj4gPj4gZWFybHkgYm9vdCBmb3IgdmVyeSBz
aW1wbGlzdGljIGVudmlyb25tZW50cyAoYmVmb3JlIHRoZSByZXN0IG9mIHRoZQo+ID4+IGtlcm5l
bCBpcyB1cCwgZXRjKS4gS2VlcGluZyB0aGUgU0JJIGNvbnNvbGUgYXJvdW5kIGJleW9uZCBlYXJs
eSBib290LAo+ID4+IGFuZCBzb21laG93IHRyeWluZyB0byBvcHRpbWl6ZSBmb3IgaXQgZm9yIHRo
b3NlIHVzZSBjYXNlcyBpcyBhCj4gPj4gbWlzZGlyZWN0ZWQgZWZmb3J0OyB0aGF0J3Mgd2hhdCBu
YXRpdmUgZHJpdmVycyBhcmUgZm9yLgo+ID4KPiA+ICBzcGlrZSAod2hpY2ggaXMgb25seSBhcm91
bmQgNywwMDAgbGluZXMgb2YgY29kZSkgZG9lc24ndCBoYXZlIG5hdGl2ZQo+ID4gZHJpdmVycywg
YW5kIHFlbXUgaXMgdG9vIGhlYXZ5LWR1dHkgdG8gY29uc2lkZXIgYWRkaW5nIGN1c3RvbQo+ID4g
ZXh0ZW5zaW9ucyBhbmQgZXhwZXJpbWVudGFsIHJlc2VhcmNoIG9udG8uCj4gPgo+ID4gIHdpdGgg
bm90aGluZyBpbiBzcGlrZSAqb3RoZXIqIHRoYW4gdGhlIHNlcmlhbCBjb25zb2xlLCBpdCdzIHRo
ZSBvbmx5Cj4gPiB3YXkgaW4gYW5kIG91dC4KPiA+Cj4gPiAgbC4KPgo+IEFueXRoaW5nIG1vcmUg
dGhhbiBhIG1haW4vZGVidWcgY29uc29sZSBpcyB0b28gbXVjaCBmb3IgdGhlIFNCSSwgaXRzCj4g
Z29hbCBpcyB0byBiZSB1c2VkIGVhcmx5IG9uIGluIHRoZSBib290IHByb2Nlc3MgdW50aWwgdGhl
IE9TIG9yIHRoZQo+IGJhcmUgbWV0YWwgYXBwIHRha2VzIGNvbnRyb2wuIEhhdmluZyBtdWx0aXBs
ZSBzZXJpYWwgbGluZXMgdGhyb3VnaAo+IHRoZSBTQkkgZm9yIHRoaW5ncyBsaWtlIFBQUCwgVVBT
LCB2aXJ0dWFsIGNvbnNvbGVzIGFuZCBhbGwgdGhlIHN0dWZmCj4geW91IG1lbnRpb25lZCBpcyBv
dXQgb2Ygc2NvcGUuIEJvb3QgYW4gT1MgYW5kIHVzZSB0aGUgc3RhbmRhcmQgVUFSVAo+IGRyaXZl
cnMgZm9yIGFjY2Vzc2luZyB0aGUgc2VyaWFsIGxpbmVzLiBJZiB0aGVyZSBhcmUgbm8gZHJpdmVy
cwo+IG9yIHN1cHBvcnQgb24gc3Bpa2UsIGl0J3Mgb3BlbiBzb3VyY2UgISBBbHNvIHlvdSBtYXkg
YWx3YXlzIHVzZQo+IHRoZSB2ZW5kb3Igc3BlY2lmaWMgU0JJIHRoYXQgQXRpc2ggcHJvcG9zZXMg
aGVyZSBmb3IgYWRkaW5nIHRoYXQKPiBmdW5jdGlvbmFsaXR5LCBoYXZpbmcgdGhpcyBvbiB0aGUg
YmFzZSBTQkkgaXMgbm90IHRoZSByaWdodAo+IGFwcHJvYWNoIElNSE8uCj4KPiBSZWdhcmRzLAo+
IE5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
