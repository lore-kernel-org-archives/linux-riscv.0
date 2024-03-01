Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6BEC54798
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxvmEah9wShYLSBnKsqmCthuJI3yYnnuMi+Y8xxRPAI=; b=dagWeMd8w+RDYc
	hI0GJBLIbGzO3Be+Fzk7ao7OYIqgywjd7frgIZ+SvUYpAzXvtQfncDVCihoUMkcDmvrYSqZpqC8pQ
	iDiDSCRBeNGeaMxbU/RIyPH9rYnaqhsDkDlHw7tpVl0/qTOSrNnQ2S8kJ9+An7ihIQu1w9Db96VnL
	l6IpJxwFNrYBPSBfVE2TuBL8QBQw2bpcfZTyp/qRM+wu5lvdm0IYPJBZqdpPa8hiL+F1cP1UeLAxb
	aoqphMxLrXZ6BYzZIjhdDDqhJisUQItConH+SxJ1kCFRwznYWCz51LTXB/BxHYHzTM3sPNMtotIgR
	rGBChea0FnLM+XEf1o/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsOF-0000000FyGM-1EIo;
	Fri, 01 Mar 2024 02:12:47 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsOC-0000000FyF6-3bXp
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 02:12:46 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6e48153c13aso862489a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 18:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709259160; x=1709863960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3SFfjWGyTSE99qrr0Tnrw16LTdrZNolz0yFIJjwrxw=;
        b=h6iQ2yy/trh9teIf7Mfm5p/Zhxpest/YyYFlx2K2Lo1FPTa09x7fKARYVl4nvaenha
         WZsb0KBkzOmmKKkvHGheqRLGng+PxF8ABoguIqV1JK9HHM+ybbrxozATlGnGVq/v4FWO
         IO/buHrHPQtuf9HDQT0kGKeyc/YfTG54d/JkRhqbbpvj8qTWrTyv1+MEuYYOwGeUg2Ib
         kOTbqj7w4Bp1efl8UXLUKNKc/B0nby7ampR8bNg1ZA2m+Pn4Zp0CqYtA00uX7tKs15Lq
         S3aMcHFiF6yaSbRZXH0V27vJOtpQVFh6wvkiCh7MJ6bs6aH+R43T9FXzGd9X9/ajMKX5
         8TZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709259160; x=1709863960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3SFfjWGyTSE99qrr0Tnrw16LTdrZNolz0yFIJjwrxw=;
        b=TO0oV70AHh697NoiuVzdY3UlXy5f0T3s/u75VWErPwHUqGSu10RGtRVmWoEUwdLErz
         Rx1E+UECvqClkKt3iSyhl2uTMWeJoPfuHuDDXUzNdSe1/lBK/qHlZqedaK3+Tv4dQwsp
         yQYzHgK9gSMT4lwk8LHkJI4NUHWlrac8bIex0OsNpNiFcvWvU6Wa2cVowfHP35c1cFZX
         y6ouPlv9LN58eZG9jZ2AUhlgL2iSKimWs6lUEDpoS4pybGj1fEy+FoaoR1sH4OrYP52I
         4wzOBQiTdOaaWYZjB1j7FmM4i4NJVpVVc8Op31XcWckb0By+VxYDiMTdFP79aMAe9I3h
         7LSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSUTPWg+HL0Ra/4pskc7fzxbMDXhbU+hrTk8WSOS4jT7uUe4IUHN06UtSsQCol2WMvuI+rRBjoBxI/EbCbYc22Wzx+zyqlJ5HrOxon73xX
X-Gm-Message-State: AOJu0YzAvEndu0LYJL8SmbKlHoKzVD6Ep76C19pR7NzHVztWHJmN78c1
	pz0DrdG8bfbIvEqSYO4T8BT0WkzN+xImnoYdcnNZoQrT2VI6T1nikvSjpf6b0pQjQEnW4QIjcHf
	SaHOLn5NR9mxn9z3iZfnMzO6qeawurvKfvvGhoA==
X-Google-Smtp-Source: AGHT+IHo//tiM479EyQm3qLlzScCeQGdZKUojNRzyefzcHNqYrNX/D/mumQN7bmlRV1/paZVkvfk9qXQoBjLMcEk9aI=
X-Received: by 2002:a05:6870:2b19:b0:220:abe0:8efb with SMTP id
 ld25-20020a0568702b1900b00220abe08efbmr375688oab.13.1709259159890; Thu, 29
 Feb 2024 18:12:39 -0800 (PST)
MIME-Version: 1.0
References: <20240229232211.161961-1-samuel.holland@sifive.com> <20240229232211.161961-7-samuel.holland@sifive.com>
In-Reply-To: <20240229232211.161961-7-samuel.holland@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 1 Mar 2024 10:12:28 +0800
Message-ID: <CAEEQ3wnCAqPjXEnSXc9Vce-kWETmbUpyzBdXi_2K+h+NZt4SqQ@mail.gmail.com>
Subject: Re: [External] [PATCH v5 06/13] riscv: mm: Combine the SMP and UP TLB
 flush code
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_181244_923080_10EAC5A5 
X-CRM114-Status: GOOD (  19.45  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBNYXIgMSwgMjAyNCBhdCA3OjIy4oCvQU0gU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSW4gU01QIGNvbmZpZ3Vy
YXRpb25zLCBhbGwgVExCIGZsdXNoaW5nIG5hcnJvd2VyIHRoYW4gZmx1c2hfdGxiX2FsbCgpCj4g
Z29lcyB0aHJvdWdoIF9fZmx1c2hfdGxiX3JhbmdlKCkuIERvIHRoZSBzYW1lIGluIFVQIGNvbmZp
Z3VyYXRpb25zLgo+Cj4gVGhpcyBhbGxvd3MgVVAgY29uZmlndXJhdGlvbnMgdG8gdGFrZSBhZHZh
bnRhZ2Ugb2YgcmVjZW50IGltcHJvdmVtZW50cwo+IHRvIHRoZSBjb2RlIGluIHRsYmZsdXNoLmMs
IHN1Y2ggYXMgc3VwcG9ydCBmb3IgaHVnZSBwYWdlcyBhbmQgZmx1c2hpbmcKPiBtdWx0aXBsZS1w
YWdlIHJhbmdlcy4KPgo+IFJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xs
YW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBzaW5jZSB2NCkKPgo+IENoYW5n
ZXMgaW4gdjQ6Cj4gIC0gTWVyZ2UgdGhlIHR3byBjb3BpZXMgb2YgX19mbHVzaF90bGJfcmFuZ2Uo
KSBhbmQgcmVseSBvbiB0aGUgY29tcGlsZXIKPiAgICB0byBvcHRpbWl6ZSBvdXQgdGhlIGJyb2Fk
Y2FzdCBwYXRoIChib3RoIGNsYW5nIGFuZCBnY2MgZG8gdGhpcykKPiAgLSBNZXJnZSB0aGUgdHdv
IGNvcGllcyBvZiBmbHVzaF90bGJfYWxsKCkgYW5kIHJlbHkgb24gY29uc3RhbnQgZm9sZGluZwo+
Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBNb3ZlIHRoZSBTTVAvVVAgbWVyZ2UgZWFybGllciBpbiB0
aGUgc2VyaWVzIHRvIGF2b2lkIGJ1aWxkIGlzc3Vlcwo+ICAtIE1ha2UgYSBjb3B5IG9mIF9fZmx1
c2hfdGxiX3JhbmdlKCkgaW5zdGVhZCBvZiBhZGRpbmcgaWZkZWZzIGluc2lkZQo+ICAtIGxvY2Fs
X2ZsdXNoX3RsYl9hbGwoKSBpcyB0aGUgb25seSBmdW5jdGlvbiB1c2VkIG9uICFNTVUgKHNtcGJv
b3QuYykKPgo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAzMCArKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSAgICAgICAgICAgIHwgIDUgKy0t
LS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
IGluZGV4IDBiZmNmZWM2N2VkNS4uZGU5YjZmMjI3OWZmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC02MCw3ICs2MCw3IEBA
IGNvbmZpZyBSSVNDVgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfVVNFX01FTVRFU1QKPiAgICAgICAg
IHNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUwo+ICAgICAgICAgc2VsZWN0IEFSQ0hfVVNF
U19DRklfVFJBUFMgaWYgQ0ZJX0NMQU5HCj4gLSAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0JBVENI
RURfVU5NQVBfVExCX0ZMVVNIIGlmIFNNUCAmJiBNTVUKPiArICAgICAgIHNlbGVjdCBBUkNIX1dB
TlRfQkFUQ0hFRF9VTk1BUF9UTEJfRkxVU0ggaWYgTU1VCj4gICAgICAgICBzZWxlY3QgQVJDSF9X
QU5UX0RFRkFVTFRfVE9QRE9XTl9NTUFQX0xBWU9VVCBpZiBNTVUKPiAgICAgICAgIHNlbGVjdCBB
UkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKPiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfR0VORVJB
TF9IVUdFVExCIGlmICFSSVNDVl9JU0FfU1ZOQVBPVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKPiBpbmRleCA5MjhmMDk2ZGNhMjEuLjRmODY0MjRiMWJhNSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3RsYmZsdXNoLmgKPiBAQCAtMjcsMTIgKzI3LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGxv
Y2FsX2ZsdXNoX3RsYl9wYWdlKHVuc2lnbmVkIGxvbmcgYWRkcikKPiAgewo+ICAgICAgICAgQUxU
X0ZMVVNIX1RMQl9QQUdFKF9fYXNtX18gX192b2xhdGlsZV9fICgic2ZlbmNlLnZtYSAlMCIgOiA6
ICJyIiAoYWRkcikgOiAibWVtb3J5IikpOwo+ICB9Cj4gLSNlbHNlIC8qIENPTkZJR19NTVUgKi8K
PiAtI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAgICAgICBkbyB7IH0g
d2hpbGUgKDApCj4gLSNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX3BhZ2UoYWRkcikgICAgICAgICAg
ICAgZG8geyB9IHdoaWxlICgwKQo+IC0jZW5kaWYgLyogQ09ORklHX01NVSAqLwo+Cj4gLSNpZiBk
ZWZpbmVkKENPTkZJR19TTVApICYmIGRlZmluZWQoQ09ORklHX01NVSkKPiAgdm9pZCBmbHVzaF90
bGJfYWxsKHZvaWQpOwo+ICB2b2lkIGZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSk7
Cj4gIHZvaWQgZmx1c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25l
ZCBsb25nIHN0YXJ0LAo+IEBAIC01NCwyNyArNDksOCBAQCB2b2lkIGFyY2hfdGxiYmF0Y2hfYWRk
X3BlbmRpbmcoc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVhZGRyKTsKPiAgdm9pZCBh
cmNoX2ZsdXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+ICB2
b2lkIGFyY2hfdGxiYmF0Y2hfZmx1c2goc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2gg
KmJhdGNoKTsKPiAtCj4gLSNlbHNlIC8qIENPTkZJR19TTVAgJiYgQ09ORklHX01NVSAqLwo+IC0K
PiAtI2RlZmluZSBmbHVzaF90bGJfYWxsKCkgbG9jYWxfZmx1c2hfdGxiX2FsbCgpCj4gLSNkZWZp
bmUgZmx1c2hfdGxiX3BhZ2Uodm1hLCBhZGRyKSBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRyKQo+
IC0KPiAtc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWdu
ZWQgbG9uZyBlbmQpCj4gLXsKPiAtICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAtfQo+
IC0KPiAtLyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiAtc3RhdGljIGlubGlu
ZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAtICAg
ICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+IC17Cj4gLSAgICAgICBsb2NhbF9mbHVzaF90bGJfYWxs
KCk7Cj4gLX0KPiAtCj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxsKCkK
PiAtI2RlZmluZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6ZSkg
Zmx1c2hfdGxiX2FsbCgpCj4gLSNlbmRpZiAvKiAhQ09ORklHX1NNUCB8fCAhQ09ORklHX01NVSAq
Lwo+ICsjZWxzZSAvKiBDT05GSUdfTU1VICovCj4gKyNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX2Fs
bCgpICAgICAgICAgICAgICAgICAgZG8geyB9IHdoaWxlICgwKQo+ICsjZW5kaWYgLyogQ09ORklH
X01NVSAqLwo+Cj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX1RMQkZMVVNIX0ggKi8KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKPiBp
bmRleCAyYzg2OWY4MDI2YTguLmNiZTRkNzc1ZWY1NiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IEBAIC0xMywxNCAr
MTMsMTEgQEAgZW5kaWYKPiAgS0NPVl9JTlNUUlVNRU5UX2luaXQubyA6PSBuCj4KPiAgb2JqLXkg
Kz0gaW5pdC5vCj4gLW9iai0kKENPTkZJR19NTVUpICs9IGV4dGFibGUubyBmYXVsdC5vIHBhZ2Vh
dHRyLm8gcGd0YWJsZS5vCj4gK29iai0kKENPTkZJR19NTVUpICs9IGV4dGFibGUubyBmYXVsdC5v
IHBhZ2VhdHRyLm8gcGd0YWJsZS5vIHRsYmZsdXNoLm8KPiAgb2JqLXkgKz0gY2FjaGVmbHVzaC5v
Cj4gIG9iai15ICs9IGNvbnRleHQubwo+ICBvYmoteSArPSBwbWVtLm8KPgo+IC1pZmVxICgkKENP
TkZJR19NTVUpLHkpCj4gLW9iai0kKENPTkZJR19TTVApICs9IHRsYmZsdXNoLm8KPiAtZW5kaWYK
PiAgb2JqLSQoQ09ORklHX0hVR0VUTEJfUEFHRSkgKz0gaHVnZXRsYnBhZ2Uubwo+ICBvYmotJChD
T05GSUdfUFREVU1QX0NPUkUpICs9IHB0ZHVtcC5vCj4gIG9iai0kKENPTkZJR19LQVNBTikgICAr
PSBrYXNhbl9pbml0Lm8KPiAtLQo+IDIuNDMuMQo+CgpnaXQgYW0gdGhlIHBhdGNoIGZhaWxlZC4g
V2FzIGl0IGEgcGF0Y2ggYmFzZWQgb24gdGhlIHRvcCBjb21taXQgb2YgbGludXgtbmV4dCA/CgpU
aGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
