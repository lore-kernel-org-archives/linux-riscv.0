Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCEBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 21:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEZvXWXPO/96SW6rDkqKwnJV5cymLVI+APNH/2GnfiI=; b=tTbo1440IT1yHC
	bTC0CfXTFJPimhvtdLsy98YlPU/664yZDdOv6BcKwCXkytOi5VEE1j9g5uWMORhamGrStl/PCC61C
	+sdjNN8wzwPYoJ15xopdelzEKtwfP5UFreRj5Dbf7NJyNiUcrIxDYdZK4pCqk3C68NlqMSYqeBPW3
	SIC27TrohQPjI+clcFR3kTr4giIb5RTMXVKf08odk358jdO1vFNP3HrR8WxHX5gneSA+IJoq3fkhH
	QY2CvH7BuHyE3NVLuVXft8BAYzVffJshq5DNUku44t5c/O5uk3e5FFooUMJUQm7z4qQ585jb+k0F6
	tEv9U8NE3uX9KvqIT1xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzlp-0057Rv-2o;
	Thu, 30 Mar 2023 21:25:21 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzll-0057Qz-3D
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 21:25:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id br6so26248765lfb.11
        for <linux-riscv@lists.infradead.org>; Thu, 30 Mar 2023 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680211515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqYBLcFFkNS/UgYTJsvNxji20IdJ1DULm+w6DtBki4=;
        b=gy/54b0UsOHthQjf3JEADvmY5I+IUJvFjCAXPsGfjxeR2WRZkkgf5VbtrOND5mQnty
         mTyCaFMS7EjfoB3lyjPHLCbZfY2SOgJp7pWI0Sq+2/vzi7aPZOja4vE/a/yCFkc1Gk/y
         EkeE00rqXSWfBBDmkrLc5eU4KXQpDC1YT1fxScZSg+icIsHGmPQhILPbh1IpiMSO0ayC
         O/wJI0u5FjDi2uPSjMcic1FdsiLqd2bFUkaZuLw+6JfCVLXF7CZCL8K220VlVPojiXqb
         3iZg/mW0N4sLH3p7YuUh5ftHLnFSYemU6qnxy1r7xZR0jbEesxy1uYDzlzLHaJczrp6Q
         wPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680211515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYqYBLcFFkNS/UgYTJsvNxji20IdJ1DULm+w6DtBki4=;
        b=v+ncEyzjuf/hiq9wD2WTVXx2iPUymxnZY0I9wwBcZVjg0MGAOK1dvEPepPsB8ASG/T
         iOg+5Qcu6Fqhmk/vArBZRsJhOwoJ4YgSnhsf8mTLwue1x6K5f1YRLATqifYl24EbhBGm
         saSqdUvpuRPfg1bC26NbCXlKE2BTgFKJ9sHe151svF2apoetpOTje7RBB4xGFk8vOVP7
         MrfZx3vRnUBGuMvI4vBlfYmEjIxGIPqYE2gj+X6sKihysRB2lY/y9iM9/qSBEbPqRZ6V
         Fj2cAAkHWIO8WS2laL6wH1remtZ41vC73IKHXkLPLFh0UTJaoMQtlDmyeLhhu9Es1zBs
         Z2hw==
X-Gm-Message-State: AAQBX9dDCh5+wfZ9o/2PR/3IhBdTo/dQBaw2gs8FnCxj6ZiGaIiksXlO
	M/vOCEuB/1zsozgBDb9RL6SnzS2LfY7YA0+nbWOYAA==
X-Google-Smtp-Source: AKy350YG+E22ikOANN7EgpjoEaKBmyUQkCMHo5NqvO+gl/QgqV5f2+53M+I2j1QxqSNsLgDewuS3L1HuSAYGOZAwpT4=
X-Received: by 2002:ac2:4884:0:b0:4db:1999:67a3 with SMTP id
 x4-20020ac24884000000b004db199967a3mr7458577lfc.13.1680211514656; Thu, 30 Mar
 2023 14:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230221190858.3159617-1-evan@rivosinc.com> <605fb2fd-bda2-4922-92bf-e3e416d54398@app.fastmail.com>
 <CALs-HstAKtvORKwRWeh97SuAuYR61aiR-3jA2_0JCZGAJXVHbg@mail.gmail.com> <6540574.4vTCxPXJkl@diego>
In-Reply-To: <6540574.4vTCxPXJkl@diego>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 30 Mar 2023 14:24:38 -0700
Message-ID: <CALs-Hsvgg6aZctwxjMqi2k6D5QFWy6oOEG682gb7xb3T2iNE4A@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] RISC-V: Add a syscall for HW probing
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_142518_040059_E502AD78 
X-CRM114-Status: GOOD (  54.64  )
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, slewis@rivosinc.com, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, Bagas Sanjaya <bagasdotme@gmail.com>, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vineetg@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMzAsIDIwMjMgYXQgMToyMOKAr1BNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0Bz
bnRlY2guZGU+IHdyb3RlOgo+Cj4gQW0gRG9ubmVyc3RhZywgMzAuIE3DpHJ6IDIwMjMsIDIwOjMw
OjI5IENFU1Qgc2NocmllYiBFdmFuIEdyZWVuOgo+ID4gT24gVGh1LCBGZWIgMjMsIDIwMjMgYXQg
MjowNuKAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBUdWUsIEZlYiAyMSwgMjAyMywgYXQgMjA6MDgsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+
ID4gV2UgZG9uJ3QgaGF2ZSBlbm91Z2ggc3BhY2UgZm9yIHRoZXNlIGFsbCBpbiBFTEZfSFdDQVB7
LDJ9IGFuZCB0aGVyZSdzIG5vCj4gPiA+ID4gc3lzdGVtIGNhbGwgdGhhdCBxdWl0ZSBkb2VzIHRo
aXMsIHNvIGxldCdzIGp1c3QgcHJvdmlkZSBhbiBhcmNoLXNwZWNpZmljCj4gPiA+ID4gb25lIHRv
IHByb2JlIGZvciBoYXJkd2FyZSBjYXBhYmlsaXRpZXMuICBUaGlzIGN1cnJlbnRseSBqdXN0IHBy
b3ZpZGVzCj4gPiA+ID4gbXthcmNoLGltcCx2ZW5kb3J9aWQsIGJ1dCB3aXRoIHRoZSBrZXktdmFs
dWUgcGFpcnMgd2UgY2FuIHBhc3MgbW9yZSBpbgo+ID4gPiA+IHRoZSBmdXR1cmUuCj4gPiA+ID4K
PiA+ID4gPiBDby1kZXZlbG9wZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3Np
bmMuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMu
Y29tPgo+ID4gPgo+ID4gPiBJJ20gc3RpbGwgc2tlcHRpY2FsIGFib3V0IHRoZSBuZWVkIGZvciBh
IGN1c3RvbSBzeXNjYWxsIGludGVyZmFjZSBoZXJlLgo+ID4gPiBJIGhhZCBub3QgbG9va2VkIGF0
IHRoZSBpbnRlcmZhY2Ugc28gZmFyLCBidXQgdGhlcmUgYXJlIGEgZmV3IHRoaW5ncwo+ID4gPiB0
aGF0IHN0aWNrIG91dDoKPiA+ID4KPiA+ID4gPiArUklTQy1WIEhhcmR3YXJlIFByb2JpbmcgSW50
ZXJmYWNlCj4gPiA+ID4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+
ICsKPiA+ID4gPiArVGhlIFJJU0MtViBoYXJkd2FyZSBwcm9iaW5nIGludGVyZmFjZSBpcyBiYXNl
ZCBhcm91bmQgYSBzaW5nbGUKPiA+ID4gPiBzeXNjYWxsLCB3aGljaAo+ID4gPiA+ICtpcyBkZWZp
bmVkIGluIDxhc20vaHdwcm9iZS5oPjo6Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgc3RydWN0IHJp
c2N2X2h3cHJvYmUgewo+ID4gPiA+ICsgICAgICAgIF9fczY0IGtleTsKPiA+ID4gPiArICAgICAg
ICBfX3U2NCB2YWx1ZTsKPiA+ID4gPiArICAgIH07Cj4gPiA+Cj4gPiA+IFRoZSB3YXkgdGhpcyBp
cyBkZWZpbmVkLCB0aGUga2VybmVsIHdpbGwgYWx3YXlzIGhhdmUgdG8ga25vdwo+ID4gPiBhYm91
dCB0aGUgc3BlY2lmaWMgc2V0IG9mIGZlYXR1cmVzLCBpdCBjYW4ndCBqdXN0IGZvcndhcmQKPiA+
ID4gdW5rbm93biBmZWF0dXJlcyB0byB1c2VyIHNwYWNlIGFmdGVyIHByb2JpbmcgdGhlbSBmcm9t
IGFuCj4gPiA+IGFyY2hpdGVjdHVyZWQgaGFyZHdhcmUgaW50ZXJmYWNlIG9yIGZyb20gRFQuCj4g
Pgo+ID4gWW91J3JlIGNvcnJlY3QgdGhhdCB0aGlzIGludGVyZmFjZSB3YXNuJ3QgaW50ZW5kZWQg
dG8gaGF2ZSB1c2VybW9kZQo+ID4gY29tZSBpbiB3aXRoIGF1Z21lbnRlZCBkYXRhIG9yIGFkZGl0
aW9uYWwga2V5L3ZhbHVlIHBhaXJzLiBUaGlzIHdhcwo+ID4gcHVyZWx5IG1lYW50IHRvIHByb3Zp
ZGUgYWNjZXNzIHRvIHRoZSBrZXJuZWwncyByZXBvc2l0b3J5IG9mCj4gPiBhcmNoaXRlY3R1cmFs
IGFuZCBtaWNyb2FyY2hpdGVjdHVyYWwgZGV0YWlscy4gSWYgdXNlcm1vZGUgd2FudHMgdG8KPiA+
IHByb3ZpZGUgZXh0cmEgaW5mbyBpbiB0aGlzIHNhbWUgZm9ybSwgbWF5YmUgdGhleSBjb3VsZCB3
cmFwIHRoaXMKPiA+IGludGVyZmFjZS4KPiA+Cj4gPiA+IElmICdrZXknIGlzIGp1c3QgYW4gZW51
bWVyYXRlZCB2YWx1ZSB3aXRoIGEgc21hbGwgbnVtYmVyIG9mCj4gPiA+IHBvc3NpYmxlIHZhbHVl
cywgSSBkb24ndCBzZWUgYW55dGhpbmcgd3Jvbmcgd2l0aCB1c2luZyBlbGYKPiA+ID4gYXV4IGRh
dGEuIEkgdW5kZXJzdGFuZCBpdCdzIGhhcmQgdG8ga25vdyBob3cgbWFueSBrZXlzCj4gPiA+IG1p
Z2h0IGJlIG5lZWRlZCBpbiB0aGUgbG9uZyBydW4sIGZyb20gdGhlIHdheSB5b3UgZGVmaW5lCj4g
PiA+IHRoZSBrZXkvdmFsdWUgcGFpcnMgaGVyZSwgSSB3b3VsZCBleHBlY3QgaXQgdG8gaGF2ZSBh
IGxvdAo+ID4gPiBvZiB0aGUgc2FtZSBsaW1pdGF0aW9ucyB0aGF0IHRoZSBhdXggZGF0YSBoYXMs
IGV4Y2VwdCBmb3IKPiA+ID4gYSBmZXcgYnl0ZXMgdG8gYmUgY29waWVkLgo+ID4KPiA+IENvcnJl
Y3QsIHRoaXMgbWFrZXMgYWxsb2NhdGluZyBiaXRzIG91dCBvZiBoZXJlIGNoZWFwZXIgYnkgbm90
Cj4gPiByZXF1aXJpbmcgdGhhdCB3ZSBhY3RpdmVseSBjb3B5IHRoZW0gaW50byBldmVyeSBuZXcg
cHJvY2VzcyBmb3JldmVyLgo+ID4gWW91J3JlIHJpZ2h0IHRoYXQgdGhlIGF1eCB2ZWN0b3Igd291
bGQgd29yayBhcyB3ZWxsLCBidXQgdGhlIHRoaW5raW5nCj4gPiBiZWhpbmQgdGhpcyBzZXJpZXMg
d2FzIHRoYXQgYW4gaW50ZXJmYWNlIGxpa2UgdGhpcyBtaWdodCBiZSBiZXR0ZXIgZm9yCj4gPiBh
biBhcmNoaXRlY3R1cmUgYXMgZXh0ZW5zaWJsZSBhcyByaXNjLXYuCj4KPiBXaGF0IHdvdWxkIGJl
IHRoZSByYW1pZmljYXRpb25zIG9mIGRlZmluaW5nIHNvbWUgc29ydCBvZiB2ZHNvLWxpa2UKPiBk
YXRhLXN0cnVjdHVyZSBhbmQganVzdCBwdXR0aW5nIHRoZSBhZGRyZXNzIGludG8gQVRfSFdDQVAy
ID8KPiAoc2ltaWxhciB0byB3aGF0IHZkc28gZG9lcykgLSB0aGF0IGNvdWxkIHRoZW4gZXZlbiBi
ZSByZS11c2FibGUKPiB3aXRoIG90aGVyIE9TIGtlcm5lbHMuCj4KPiBBbmQgd291bGQgYWxzbyBz
YXZlIGRlY2xhcmluZyBudW1lcm91cyBuZXcgQVRfKiBrZXlzLgo+Cj4KPiBCZWNhdXNlIHRoZXJl
IGFyZSBhbHJlYWR5IG5lYXJseSAxMzAgc3RhbmRhcmQgZXh0ZW5zaW9ucyBhbmQgdmVuZG9ycwo+
IGFyZSBhbGxvd2VkIHRvIGRlZmluZXMgdGhlaXIgb3duIGFzIHdlbGwsIGFuZCB3ZSB3aWxsIHBy
b2JhYmx5IGFsc28gd2FudAo+IHRvIHRlbGwgdXNlcnNwYWNlIGFib3V0IHRoZW0uCgpZZWFoIEkg
bXVsbGVkIHRoYXQgYXBwcm9hY2ggb3ZlciBhIGJpdCBvcmlnaW5hbGx5IGFzIHdlbGwuIFRoZQpk
b3duc2lkZSBpcyB0aGUgdmRzbyBkYXRhIHRoZW4gYmVjb21lcyBwYXJ0IG9mIHRoZSBBQkkuIFNv
IHlvdSBjYW4KbmV2ZXIgY2hhbmdlIHRoZSBsYXlvdXQgb2YgdGhhdCB2ZHNvIGRhdGEsIGFuZCB5
b3UgbG9zZSB0aGUgYWJpbGl0eSB0bwpjaGFuZ2Ugd2hhdCBnZXRzIGNhY2hlZCBpbiB0aGUgdmRz
byB2ZXJzdXMgd2hhdCBib3VuY2VzIHVwIHRvIHRoZQpzeXNjYWxsLiBUbyBwb2FjaCBhIHNjZW5h
cmlvIGZyb20gYSBnbGliYyBkaXNjdXNzaW9uIHVuZGVyd2F5LCBpZiBmb3IKaW5zdGFuY2UgY3B1
IGhvdHBsdWcgY29tZXMgYWxvbmcgYW5kIHlvdSBuZWVkIHRvIGludmFsaWRhdGUgc29tZQpwb3J0
aW9uIG9mIHlvdXIgY2FjaGVkIGRhdGEsIHRoYXQncyBlYXN5IHdoZW4gdGhlcmUncyBhIGZ1bmN0
aW9uIGluCmZyb250IG9mIGl0LCBidXQgZGlmZmljdWx0IGlmIGFwcHMgYXJlIGNyYXdsaW5nIHRo
ZSBkYXRhIHRoZW1zZWx2ZXMuCgoxMzAgZXh0ZW5zaW9ucyBpcyBjZXJ0YWlubHkgYSBsb3QsIGFu
ZCBpbGx1c3RyYXRlcyBob3cgYXV4dmVjIG1heSBnZXQKb3V0IG9mIGhhbmQgcXVpY2tseS4gT25l
IG5pY2UgdGhpbmcgYWJvdXQgdGhpcyBtZWNoYW5pc20gKHRob3VnaCBvdGhlcgphcHByb2FjaGVz
IHNoYXJlIHRoaXMgdHJhaXQpIGlzIHRoYXQgaXQncyBhZ25vc3RpYyBvZiB3aGVyZSB0aGUgZGF0
YQpjb21lcyBmcm9tLiBJbiBvdGhlciB3b3JkcywgaXQgZG9lc24ndCByZXF1aXJlIHRoYXQgZGF0
YSBjb21lIGZyb20gdGhlCkRULCBvciBhbHRlcm5hdGl2ZS5jLCBldGMsIGFzIGxvbmcgYXMgdGhl
IGtlcm5lbCBjYW4gYWNjZXNzIGl0IGFuZApwbHVuayBpdCBpbiBhIGtleS92YWx1ZSBzdG9yZS4K
LUV2YW4KCj4KPgo+IEhlaWtvCj4KPgo+ID4gPiA+ICsgICAgbG9uZyBzeXNfcmlzY3ZfaHdwcm9i
ZShzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpcnMsIHNpemVfdAo+ID4gPiA+IHBhaXJfY291bnQs
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBjcHVfY291bnQsIGNw
dV9zZXRfdCAqY3B1cywKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyBmbGFncyk7Cj4gPiA+Cj4gPiA+IFRoZSBjcHUgc2V0IGFyZ3VtZW50IHdvcnJpZXMg
bWUgbW9yZTogdGhlcmUgc2hvdWxkIG5ldmVyIGJlIGEKPiA+ID4gbmVlZCB0byBvcHRpbWl6ZSBm
b3IgYnJva2VuIGhhcmR3YXJlIHRoYXQgaGFzIGFuIGFzeW1tZXRyaWMgc2V0Cj4gPiA+IG9mIGZl
YXR1cmVzLiBKdXN0IGxldCB0aGUga2VybmVsIGZpZ3VyZSBvdXQgdGhlIG1pbmltdW0gc2V0Cj4g
PiA+IG9mIGZlYXR1cmVzIHRoYXQgd29ya3MgYWNyb3NzIGFsbCBDUFVzIGFuZCByZXBvcnQgdGhh
dCBsaWtlIHdlCj4gPiA+IGRvIHdpdGggSFdDQVAuIElmIHRoZXJlIGlzIGEgU29DIHRoYXQgaXMg
c28gYnJva2VuIHRoYXQgaXQgaGFzCj4gPiA+IGltcG9ydGFudCBmZWF0dXJlcyBvbiBhIHN1YnNl
dCBvZiBjb3JlcyB0aGF0IHNvbWUgdXNlciBtaWdodAo+ID4gPiBhY3R1YWxseSB3YW50IHRvIHJl
bHkgb24sIHRoZW4gaGF2ZSB0aGVtIGdvIHRocm91Z2ggdGhlIHNsb3cKPiA+ID4gc3lzZnMgaW50
ZXJmYWNlIGZvciBwcm9iaW5nIHRoZSBDUFVzIGluZGlkdWFsbHksIGJ1dCBkb24ndCBtYWtlCj4g
PiA+IHRoZSBicm9rZW4gY2FzZSBlYXNpZXIgYXQgdGhlIGV4cGVuc2Ugb2Ygbm9ybWFsIHVzZXJz
IHRoYXQKPiA+ID4gcnVuIG9uIHdvcmtpbmcgaGFyZHdhcmUuCj4gPgo+ID4gSSdtIG5vdCBzbyBz
dXJlLiBXaGlsZSBJIGFncmVlIHdpdGggeW91IGZvciBtYWpvciBjbGFzc2VzIG9mIGZlYXR1cmVz
Cj4gPiAoZWcgb25lIENQVSBoYXMgZmxvYXRpbmcgcG9pbnQgc3VwcG9ydCBidXQgYW5vdGhlciBk
b2VzIG5vdCksIEkgZXhwZWN0Cj4gPiB0aGVzZSBiaXRzIHRvIGNvbnRhaW4gbW9yZSBzdWJ0bGUg
ZGV0YWlscyBhcyB3ZWxsLCB3aGljaCBtaWdodCB2YXJ5Cj4gPiBhY3Jvc3MgYXN5bW1ldHJpYyBp
bXBsZW1lbnRhdGlvbnMgd2l0aG91dCBicmVha2luZyBBQkkgY29tcGF0aWJpbGl0eQo+ID4gcGVy
LXNlLiBNYXliZSBzb21lIHZlbmRvciBoYXMgaW1wbGVtZW50ZWQgZXhvdGljIHZpZGVvIGRlY29k
aW5nCj4gPiBhY2NlbGVyYXRpb24gaW5zdHJ1Y3Rpb25zIHRoYXQgb25seSB3b3JrIG9uIHRoZSBi
aWcgY29yZS4gT3IgbWF5YmUgdGhlCj4gPiBiaWcgY29yZXMgc3VwcG9ydCB2My4xIG9mIHNvbWUg
ZXh0ZW5zaW9uICh3aGVyZSBjZXJ0YWluIHRoaW5ncyBydW4KPiA+IGZhc3RlciksIGJ1dCB0aGUg
bGl0dGxlIGNvcmVzIG9ubHkgaGF2ZSB2My4wLCB3aGVyZSBpdCdzIGEgbGl0dGxlCj4gPiBzbG93
ZXIuIENlcnRhaW4gYXBwcyB3b3VsZCBsaWtlbHkgd2FudCB0byBrbm93IHRoZXNlIHRoaW5ncyBz
byB0aGV5Cj4gPiBjYW4gYWxsb2NhdGUgdGhlaXIgd29yayBvcHRpbWFsbHkgYWNyb3NzIGNvcmVz
Lgo+ID4KPiA+ID4KPiA+ID4gPiArYXNtbGlua2FnZSBsb25nIHN5c19yaXNjdl9od3Byb2JlKHVp
bnRwdHJfdCwgdWludHB0cl90LCB1aW50cHRyX3QsCj4gPiA+ID4gdWludHB0cl90LAo+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludHB0cl90LCB1aW50cHRyX3QpOwo+
ID4gPgo+ID4gPiBXaHkgJ3VpbnRwdHJfdCcgcmF0aGVyIHRoYW4gdGhlIGNvcnJlY3QgdHlwZT8K
PiA+Cj4gPiBGaXhlZC4KPiA+IC1FdmFuCj4gPgo+Cj4KPgo+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
