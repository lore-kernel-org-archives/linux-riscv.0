Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7103AC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNGa7W6bwWxG0yRTFnN+gqSbiA1NcAR/3/aRWXAGU78=; b=2f+/JRa/qxwM+i
	lQISaG5YyhfqETNeMsaOU18OF1ekZrjTjYBOJTr7of+zgyZQl0shvZ7PCMV/nXgR09yxPcYd+fdI8
	UNgT2I0Gu/TGJczgGpC1irPxnk1U7zCQ+s2Yjmq0r0WTzlA9XhqJolUzQWc5WWr9pathC5E/xsF/s
	Op94SodB4m97JYu4e5/SV7T9PWeaTt6PWJ8eoISvQxrOxCAqPV+aJHCscEQHs9YLBBrdONlNvVcOi
	yPk8AJq3x+VFGq81AtGJbyGNhec8m1bVyXzQ89BumVLjZTnLWDbHYGWDi8iiviLaR/1wTL5663E2c
	DVyhFqhFTP0pstCbuHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyc5t-000a1c-LE; Fri, 25 Nov 2022 17:02:29 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyc5q-000ZzU-Ll
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 17:02:28 +0000
Received: by mail-oi1-x236.google.com with SMTP id n205so5012719oib.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 09:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8p2er6vYfqCfqFsOuZ0+G7Otheq3kxzcZn+N3z+8V0=;
        b=KFpSrk5d0tH9IJd2C5hc70tQFloQ0QERwXIrXVcf2GauZ1icF5YCbqcRBPn295kyIg
         OaZmjeoD+kBzn/KSWa82qNyU2OkzExXsboBUmk953Ue9KWc0QYNtQhoNdRdbwpv8lBN9
         XuYDRT6gab5SkVlF4EUvInssE0az4BBA7s9GHySg3Fq1qaSjTfn0awiWxVpE2rTfXc4i
         wQ/8rcBBizWnUIupStASmzPMGBUHSzJuVxgfocm59n/K0OzDUH299oGnFDAtaRN9Y0x/
         s97/6fBYsdVVUbQIN62PxojL0XriRQjhEpEM89gmSjwvQFF/SCz3P+ijQnTtKwv3zH7F
         VbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8p2er6vYfqCfqFsOuZ0+G7Otheq3kxzcZn+N3z+8V0=;
        b=LzB+WnacIatAn/3BhVC+C5VKdePTbeRNRCTDl85FlMA1UcJNFPc7onKMqyDYrM5I/8
         +e/JIRChFm6o6MfvgR56+Y08p2SLqfk4GVB/wMWaa3fKfiknUW07tysQZsfzO9cMClTZ
         ApuSt3DxKixXEt6JdSL5jStC56ytdz+RPvDWDabohYUO9enVVoyLeGXoCgC+vb5LedGN
         k8mu8UpolIyFfBehvpC3OMIwP4TyZxNaXzh39ESZwrnNczADNLtJdiqpod6+/z/it8BA
         cejM8HpMqXaljUjNCDa3SBGcuMsKUB/3FHqUsV25glNs0fRRwdLxk1iOrbnm/hNTHUbl
         OM1w==
X-Gm-Message-State: ANoB5pkY8Vgi2RuEhHyjUspbCDYXunwFkC0oVNpcUain2k9KUoa8IVLw
	c/gCCCoNu+xVej4WlHSxKgntaO7qnEZlCsOk5O8lJw==
X-Google-Smtp-Source: AA0mqf4K4vWoFGs8wFjHZLCFzIGCFID6VHCpWPM3KNrOH/4k9l2OTzZTL/9bac77Yyl2Df7euim0Y7gujIEEHlW69KY=
X-Received: by 2002:aca:f307:0:b0:354:3e50:f66c with SMTP id
 r7-20020acaf307000000b003543e50f66cmr9100522oih.112.1669395743901; Fri, 25
 Nov 2022 09:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <14728581.RDIVbhacDa@diego>
 <Y3/xGhkbf6qEr+5r@spud> <3259590.VLH7GnMWUR@phil> <20221125074933.2xuyaeuk5kmi5miw@kamzik>
 <CAEg0e7h9skbWPVDsz9CdB8dATN5XM9eT-uPY0A7xRZmX=qTU6A@mail.gmail.com>
 <20221125152821.ytipefad7oxv733t@kamzik> <CAEg0e7g132REPxisSFJZorXbSqzb4q1Tj7FC8G9pDMymt0qZuw@mail.gmail.com>
 <Y4Dv0Vfz6AAg/X19@spud>
In-Reply-To: <Y4Dv0Vfz6AAg/X19@spud>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 25 Nov 2022 18:02:12 +0100
Message-ID: <CAEg0e7h-m6oMYd+W2=89t4iPLKLz6TsLzKzUmAq1vuOTeawsUQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] RISC-V: add zbb support to string functions
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	prabhakar.csengg@gmail.com, philipp.tomsich@vrull.eu, 
	emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_090226_727306_920F8058 
X-CRM114-Status: GOOD (  14.16  )
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

T24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgNTozOSBQTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQgMDU6MzU6MzlQTSArMDEw
MCwgQ2hyaXN0b3BoIE3DvGxsbmVyIHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjUsIDIwMjIgYXQg
NDoyOCBQTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+
ID4gPiAvKgo+ID4gPiAgKiBFYWNoIHN1Yi1saXN0IGlzIHNvcnRlZCBhbHBoYWJldGljYWxseS4K
PiA+ID4gICovCj4gPiA+ICNkZWZpbmUgU19FWFRFTlNJT05TICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAgICAgICBfX1JJU0NWX0lT
QV9FWFRfREFUQShzc2NvZnBtZiwgUklTQ1ZfSVNBX0VYVF9TU0NPRlBNRiksICAgICAgICAgXAo+
ID4gPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzdGMsIFJJU0NWX0lTQV9FWFRfU1NU
QyksICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
c3ZpbnZhbCwgUklTQ1ZfSVNBX0VYVF9TVklOVkFMKSwgICAgICAgICAgIFwKPiA+ID4gICAgICAg
ICBfX1JJU0NWX0lTQV9FWFRfREFUQShzdnBibXQsIFJJU0NWX0lTQV9FWFRfU1ZQQk1UKSwKPiA+
ID4KPiA+ID4gI2RlZmluZSBaaV9FWFRFTlNJT05TICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHppY2JvbSwgUklTQ1ZfSVNBX0VYVF9aSUNCT00pLCAgICAgICAgICAgICBcCj4gPiA+ICAg
ICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemloaW50cGF1c2UsIFJJU0NWX0lTQV9FWFRfWklI
SU5UUEFVU0UpLAo+ID4gPgo+ID4gPiAjZGVmaW5lIFpiX0VYVEVOU0lPTlMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgICAgX19S
SVNDVl9JU0FfRVhUX0RBVEEoemJiLCBSSVNDVl9JU0FfRVhUX1pJQ0JPTSksICAgICAgICAgICAg
ICAgIFwKPiA+ID4KPiA+ID4gc3RhdGljIHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgaXNhX2V4
dF9hcnJbXSA9IHsKPiA+ID4gICAgICAgICBaaV9FWFRFTlNJT05TCj4gPiA+ICAgICAgICAgWmJf
RVhURU5TSU9OUwo+ID4gPiAgICAgICAgIFNfRVhURU5TSU9OUwo+ID4gPiAgICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKCIiLCBSSVNDVl9JU0FfRVhUX01BWCksCj4gPiA+IH07Cj4gPgo+ID4g
SXQgbWlnaHQgYmUgd29ydGggdG8gbG9vayBob3cgQmludXRpbHMgYXJlIGdyb3VwaW5nIHRoZW06
Cj4gPiAgIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWJpbnV0aWxzLWdkYi5naXQ7YT1i
bG9iO2Y9YmZkL2VsZnh4LXJpc2N2LmMjbDEyNjEKPiA+Cj4gPiBUaGV5IGFsc28gZ3JvdXAgZXh0
ZW5zaW9ucyB0b2dldGhlciBidXQgdXNlIHRoZSBmb2xsb3dpbmcgZ3JvdXBzOgo+ID4KPiA+IGNv
bnN0IHN0cnVjdCByaXNjdl9zdXBwb3J0ZWRfZXh0ICpyaXNjdl9hbGxfc3VwcG9ydGVkX2V4dFtd
ID0KPiA+IHsKPiA+ICAgcmlzY3Zfc3VwcG9ydGVkX3N0ZF9leHQsCj4gPiAgIHJpc2N2X3N1cHBv
cnRlZF9zdGRfel9leHQsCj4gPiAgIHJpc2N2X3N1cHBvcnRlZF9zdGRfc19leHQsCj4gPiAgIHJp
c2N2X3N1cHBvcnRlZF9zdGRfenhtX2V4dCwKPiA+ICAgcmlzY3Zfc3VwcG9ydGVkX3ZlbmRvcl94
X2V4dCwKPiA+ICAgTlVMTAo+ID4gfTsKPgo+IEkgdGhpbmsgaW4gdGhpcyBjYXNlLCBEcmV3J3Mg
ZGlmZmVyZW50aWF0aW9uIGJldHdlZW4gWmkgJiBaYiBpcyBhbgo+IGltcHJvdmVtZW50IDopCgoK
VGhhdCBtaWdodCBiZSB0aGUgY2FzZSwgYnV0IGl0IGFsc28gYnJpbmdzIHVwIHRoZSBmb2xsb3dp
bmcgcXVlc3Rpb25zOgpXaGVyZSB0byBwdXQgWmYqIGV4dGVuc2lvbnMgKGJldHdlZW4gWmkgYW5k
IFpiKT8KV2hlcmUgdG8gcHV0IFprKiBhbmQgWnYqIChhZnRlciBaYiopPwpBZGRpbmcgYSBzdWJn
cm91cCBmb3IgZWFjaCBae059KiBleHRlbnNpb24gbWlnaHQgcmVzdWx0IGluIG1hbnkgc21hbGwK
Z3JvdXBzIHdpdGggbGl0dGxlIGJlbmVmaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
