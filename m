Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C94C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 16:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fCKcWVEpePJgEqL+yvLCz0Obq+osWXaQaP3gyCb+6Eo=; b=eXo4UwdVl/9P99
	MDcgx7chtdv/yHac5YVfdC2YM7lijm16iZRZTTLu7Vq4vJzTQkDEtEZJmBDQThDWVhJaayUeNuQwU
	vnhN01ry6ZgC3fWMhxN7QrqoxskWARFD+Vd3TETx4Lh03S2TNBkjDYTQuZ1x9ELlnCxlCh4TegDid
	O/y1mc3N2Aj2QAzk85otc/EKuSRebJkoidVDrZgV7tQQraa2+zP3mxgoTQ4ouibABeLw3bxaoYKwg
	ZtRr8MZqXAf8Dc8y3krNiSPfz7ns+ahnZ72UwPJIL3kha280TxsbuGbEkZ3WaC2SwfDXJ5jYDTL1D
	ibezz3X41/5GozLk6IzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jW1-00BHpZ-2r;
	Thu, 30 Nov 2023 16:03:49 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8jVy-00BHp1-1K
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 16:03:47 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-548ae9a5eeaso12047a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 08:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701360222; x=1701965022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFuAuGzjCwUvtnL2rnJIn7SWhGuOsuybendDSBRJmOk=;
        b=MTw0QZjnrxVtt84QxH88vNaoRvnHcyup/OzOqrfgqXkYYEoo+Wz/j1HDVUR4mopivH
         OeRmB44Tg2sRfGNfVU5WrWQRrjsDBPcrMF0dOMmVVrsVnp/giL0/+8PWswjjElYkYVR4
         KuULHjcSWpsg6yp90bOBUQ9NXK5Cn9Qf8aqQRyhDhDnr+wn5WDyWxaK0oQftme5pgPfC
         u//8v7aRPRbRZP38gsaaxt8Olqi6yUD6QDY9BPbcEaDfEcZvqroVAeg06qaD9F2ItGDn
         Ob8RPeF/DFuvYdyaJ3F/uJtv8Rtan2DilPt2Wi+IwyQ72aDXm0YBjKdHnoqZ5RAClqtU
         m6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701360222; x=1701965022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFuAuGzjCwUvtnL2rnJIn7SWhGuOsuybendDSBRJmOk=;
        b=r2h/hlxXrkNh4+SUYdGzSax00ZPmDIkxcP5mgf2jtnvQyEmBGEbQWKmsXcNFZKXCt3
         s+TsSGq16cmtoaPE6dVjy+Cw9f0uMvTrRjruNFW26GkdI+FqNoLWafQgcCeNzLdcQPMY
         dwnosHl8IaUlogq0tphpM2qmzcvd9PFS0WukHUPWbgznDE6srtNbPzHjfnPR2mKePGjf
         HMIe81iEkVfhIJJXaYnCW7zFOP72O1IVpVtggb2+tETm7Y5K72cDQX/djc7FLb/rFDU9
         CBNXADC5CBEdZ7iyPt/G+cPQXlobEhGz7doXlWDht31DMGyrEwRjE4b9wMcKR06zsOUA
         TZkA==
X-Gm-Message-State: AOJu0Ywty8AxDAO4h5p+ueCrPeYbrzA1JwZ7/5KMVh3iZLzxGrQHKRUB
	rYYgrphj5CH/4cWIlE4aQVd6wCqkQsQRutM9wbKAyQ==
X-Google-Smtp-Source: AGHT+IHkkTRpqYueDGoFPRUw5m2XlmHR5VdjsCOy/vnNZPUFw3AaOJiTeEkVq0ufN8mM54z9zF8WCdY8UT+NTSJXmPc=
X-Received: by 2002:a05:6402:d71:b0:54a:ee8b:7a8c with SMTP id
 ec49-20020a0564020d7100b0054aee8b7a8cmr176202edb.0.1701360221270; Thu, 30 Nov
 2023 08:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
In-Reply-To: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
From: Fangrui Song <maskray@google.com>
Date: Thu, 30 Nov 2023 08:03:27 -0800
Message-ID: <CAFP8O3KUqhfd1B__MDig1BxAR4bW1KOgGqspnPbm5xEUH9+uxg@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: Disable DWARF5 with known broken LLVM versions
To: Nathan Chancellor <nathan@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor@kernel.org, ndesaulniers@google.com, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_080346_456107_E0143049 
X-CRM114-Status: GOOD (  14.92  )
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

T24gV2VkLCBOb3YgMjksIDIwMjMgYXQgMzozMOKAr1BNIE5hdGhhbiBDaGFuY2VsbG9yIDxuYXRo
YW5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBUaGlzIHNlcmllcyBkaXNhYmxl
cyBEV0FSRjUgZm9yIExMVk0gdmVyc2lvbnMgd2hlcmUgaXQgaXMga25vd24gdG8gYmUKPiBicm9r
ZW4gZHVlIHRvIGxpbmtlciByZWxheGF0aW9uOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2xsdm0v
bGx2bS1wcm9qZWN0L2NvbW1pdC9iYmMwZjk5ZjNiYzk2ZjFkYjE2ZjY0OWZjMjFkZDE4ZTViMDkx
OGY2Cj4KPiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBpdCBzb3VuZHMgbGlrZSBHTlUgYmlu
dXRpbHMgaGFzIGEgc2ltaWxhcgo+IGlzc3VlIGJ1dCBJIGFtIG5vdCBzdXJlIG9mIHRoZSBzdGF0
dXMgb2YgdGhlIGZpeGVzIGFuZCBzdWNoLCBzbyBJIGRpZAo+IG5vdCBib3RoZXIgd2l0aCBjaGVj
a2luZyBmb3IgaXQgYnV0IGl0IHNob3VsZCBiZSBlYXN5IHRvIGFkZCBpZiBzbwo+IGRlc2lyZWQu
CgpVc2luZyBDbGFuZyB3aXRoIC1mbm8taW50ZWdyYXRlZC1hcyByZXF1aXJlcyBiaW51dGlscz49
Mi40MQpodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC8/cD1iaW51dGlscy1nZGIuZ2l0O2E9Y29t
bWl0O2g9ZjFjZDhiOTRlN2M5NDFjMmE5MTA3YzExMTJhYjIzMzk5MTZiOGVmZAoiUklTQy1WOiBT
dXBwb3J0IHN1YnRyYWN0aW9uIG9mIC51bGViMTI4LiIKClVzaW5nIC1mbm8taW50ZWdyYXRlZC1h
cyBpcyBsZXNzIGNvbW1vbiBub3dhZGF5cywgc28gSSBhZ3JlZSB3ZSBkbyBub3QKYm90aGVyIHdp
dGggY2hlY2tpbmcgZm9yIGl0IG5vdywgaWYgaXQgaXMgdG9vIHRyb3VibGVzb21lLgoKPiBDaGVl
cnMsCj4gTmF0aGFuCj4KPiAtLS0KPiBOYXRoYW4gQ2hhbmNlbGxvciAoMik6Cj4gICAgICAgcmlz
Y3Y6IEhvaXN0IGxpbmtlciByZWxheGF0aW9uIGRpc2FibGluZyBsb2dpYyBpbnRvIEtjb25maWcK
PiAgICAgICByaXNjdjogUmVzdHJpY3QgRFdBUkY1IHdoZW4gYnVpbGRpbmcgd2l0aCBMTFZNIHRv
IGtub3duIHdvcmtpbmcgdmVyc2lvbnMKPgo+ICBhcmNoL3Jpc2N2L0tjb25maWcgIHwgMTQgKysr
KysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSB8ICA0ICstLS0KPiAgbGliL0tjb25m
aWcuZGVidWcgICB8ICAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2UtY29tbWl0OiAyY2MxNGY1MmFlYjc4Y2UzZjI5Njc3
YzJkZTFmMDZjMGU5MTQ3MWFiCj4gY2hhbmdlLWlkOiAyMDIzMTEyOS1yaXNjdi1yZXN0cmljdC1k
d2FyZjUtbGx2bS1hOTgyNGJiOTc0Y2IKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IE5hdGhhbiBD
aGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPgoKCi0tIArlrovmlrnnnb8KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
