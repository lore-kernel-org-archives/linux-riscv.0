Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE721CCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 21:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v55/pAavEFSDDHEi1N8JhkJ9js9qC6EE/GkM2FSK/YY=; b=NdnACRvL07rvur
	ebveIJStdhbQfQ3vDCpWnBHCVu4tDWYKqgZLz8zZ3rgx+4sbhjmWDlAsu30MvlR5kG6pqc8YKmfcH
	ZN5pQl57NW70dP00MOi2E6Xu7feXiiGCmvm0WyeqZjr/ago8TCy9JTUkkoHumQ5QP2URwpgz2wGM9
	d2HpfH9s//VxxNexMsdvoREQW3L27ryMheS/NvMUKmtYauPtvg1ihuylSXJ6GAeiApZOGdowVpoNo
	n+AEi4KR6J0Mz/zzC23sBF3wfq6lzw8mf0k98qDCjHZRhA3SLxOY49TtwuE+a2wasM40f/jv8pQLC
	FmpPVClcgt0OESycuExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKI9-00000000kf4-3nj1;
	Tue, 21 Oct 2025 21:53:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBKI7-00000000ked-0iQP
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 21:53:16 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b50206773adso78980266b.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761083593; x=1761688393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc3WtDTd1WYQC9A9nm1WTBB9FxsPLQHScnVEcTR59VM=;
        b=EylAcilwyiNBVU9dOk9UWflloI6gPzBDS7szJoKOHE+CP10gWD+1eopzU7nPZO4zUj
         Ii8fPGj6X5BToi7ZMBz5HYwWJ8ynaql1NFsem2rmDafnE9fa13l4sqXQVLt4YnWmhUvA
         jWeacVU1BlAzI6zOWeZDNaaEmnPHxPoZnYyy797gv0HsoKpPVoAFr2SJic755EjzLoDE
         c/Cvv2wPc42SFT4qJIER74qgn8v64wJhSUdSJ0y1ipspbHXIjWcriHatpi6B8is/1yY4
         etk7ZM+UgLRrlXOVIsHimg4Hc5KOA0gjvY5KdhuhRGUZ1baCcsJfuotXb/DY5UZEzBsv
         91PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761083593; x=1761688393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc3WtDTd1WYQC9A9nm1WTBB9FxsPLQHScnVEcTR59VM=;
        b=mkirKvnfh650xjiFaV/xwRfV9bliZpA0WBd75iFwWrijGpI2PcdCLzCxwWifrF2R8Z
         LZeX/mAh5JdN6CIGt7qJyBpyYtb2Y5nLxvJfN50H7cX6uVkKuUAgKxrBNMVkgvU7Aclv
         AT4pq4+tjImz3LPGcTxkl/uiUNXKu7rWkyFEIHYFOJXFKyKPmppO9K6qBkRX6jPTTQLb
         +3pT3b2Fj539DHTpR2gY2e9txo+09ikVJgJbLYpQBvJzGfl0vYKwx+pM5AZtZLYkXLfq
         OF9vYu/F0c9PSW+6OsFzWkxUQ1F/7II7aK0Dv84uGF/4hkBfzQzUBW0uqI6n6y+5ILYi
         lbRg==
X-Gm-Message-State: AOJu0YynxTnkHHhMcVREVgnq59mx0aQowq96KcJrVzzIXILxJU3bcdUd
	TsX1qLFfSJFCKa/mOTBSOFlIORRoHrzHNsYo2m7WtGb1y1ehm7dZLksA1Ci3dUqKhGIltCTRuBe
	vOu28NtQBJ+nX16AWzOj76iyfprV/HXs=
X-Gm-Gg: ASbGncsCpwEU3ykev5fRDPGWNETHpEJqsRRDqvGcdrqZAxsJtzQp+TsobYz9J3twdut
	KqsL/012MiCHoqeGPchQ3u22K7GRjdwbg1xBtSH4K8HnhZmIBEmtMRJz7jA2pvnvOLgUeKIa/sy
	5cSW0WCk84+W6LSoS2QXOJjHtjTyblriVqgIzkL8hIL3SOXV59702absFP6bbLij7dpC/X7dvJx
	tWE3HqnMcatoSE4AurDp1g7fEIyPqgHlLz/m+sxat+8JoJ0BgGnwZkM5YpqwODVx7rw
X-Google-Smtp-Source: AGHT+IHgL6OS1zyNh0o71e3k4WV5Tf6ETzDakWmigXYDAG5OGfCGMEg6wbmkgvp8Wv+rjUuXZp2cr5meg9MQtWIDPkc=
X-Received: by 2002:a17:907:60d1:b0:b4a:e7fa:3196 with SMTP id
 a640c23a62f3a-b6d2c0f0100mr178904766b.20.1761083592864; Tue, 21 Oct 2025
 14:53:12 -0700 (PDT)
MIME-Version: 1.0
References: <20251007115840.2320557-1-geomatsi@gmail.com> <20251007115840.2320557-5-geomatsi@gmail.com>
 <CAFTtA3MObvXRHxbULghGcT=ThrBDeFDJzUY7LOhgNnarzpYeGg@mail.gmail.com>
 <CAFTtA3NoOZEMqYD6+vjP=09T15GiThjVy1LeDX0U8CC-4HMKOA@mail.gmail.com> <aPVYIOz8XRZ-737r@curiosity>
In-Reply-To: <aPVYIOz8XRZ-737r@curiosity>
From: Andy Chiu <andybnac@gmail.com>
Date: Tue, 21 Oct 2025 16:53:01 -0500
X-Gm-Features: AS18NWAt2pbpVXFat7QXlAftkjLF0aVf0hUbqLUhJriBx4VQpw1cMjJ_tGTeY0o
Message-ID: <CAFTtA3Op5e9gNrCrO1arpUw18oLQ4MX6cJxsiKCS+SZn48_qaA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] riscv: vector: allow to force vector context save
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Han Gao <rabenda.cn@gmail.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Nam Cao <namcao@linutronix.de>, 
	Joel Granados <joel.granados@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_145315_273289_C4B48C41 
X-CRM114-Status: GOOD (  33.27  )
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

T24gU3VuLCBPY3QgMTksIDIwMjUgYXQgNDoyOeKAr1BNIFNlcmdleSBNYXR5dWtldmljaCA8Z2Vv
bWF0c2lAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDA0OjMy
OjA1UE0gLTA1MDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0
IDM6MTjigK9QTSBBbmR5IENoaXUgPGFuZHlibmFjQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IE9uIFR1ZSwgT2N0IDcsIDIwMjUgYXQgNjo1OOKAr0FNIFNlcmdleSBNYXR5dWtldmljaCA8
Z2VvbWF0c2lAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IFdoZW4gcHRyYWNlIHVw
ZGF0ZXMgdmVjdG9yIENTUiByZWdpc3RlcnMgZm9yIGEgdHJhY2VkIHByb2Nlc3MsIHRoZQo+ID4g
PiA+IGNoYW5nZXMgbWF5IG5vdCBiZSBpbW1lZGlhdGVseSB2aXNpYmxlIHRvIHRoZSBuZXh0IHB0
cmFjZSBvcGVyYXRpb25zCj4gPiA+ID4gZHVlIHRvIHZlY3RvciBjb250ZXh0IHN3aXRjaCBvcHRp
bWl6YXRpb25zLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGZ1bmN0aW9uICdyaXNjdl92X3ZzdGF0ZV9z
YXZlJyBzYXZlcyBjb250ZXh0IG9ubHkgaWYgbXN0YXR1cy5WUyBpcwo+ID4gPiA+ICdkaXJ0eScu
IEhvd2V2ZXIgbXN0YXR1cy5WUyBvZiB0aGUgdHJhY2VkIHByb2Nlc3MgY29udGV4dCBtYXkgcmVt
YWluCj4gPiA+ID4gJ2NsZWFuJyBiZXR3ZWVuIHR3byBicmVha3BvaW50cywgaWYgbm8gdmVjdG9y
IGluc3RydWN0aW9ucyB3ZXJlIGV4ZWN1dGVkCj4gPiA+ID4gYmV0d2VlbiB0aG9zZSB0d28gYnJl
YWtwb2ludHMuIEluIHRoaXMgY2FzZSB0aGUgdmVjdG9yIGNvbnRleHQgd2lsbCBub3QKPiA+ID4g
PiBiZSBzYXZlZCBhdCB0aGUgc2Vjb25kIGJyZWFrcG9pbnQuIEFzIGEgcmVzdWx0LCB0aGUgc2Vj
b25kIHB0cmFjZSBtYXkKPiA+ID4gPiByZWFkIHN0YWxlIHZlY3RvciBDU1IgdmFsdWVzLgo+ID4g
Pgo+ID4gPiBJSVVDLCB0aGUgc2Vjb25kIHB0cmFjZSBzaG91bGQgbm90IGdldCB0aGUgc3RhbGUg
dmVjdG9yIENTUiB2YWx1ZXMuCj4gPiA+IFRoZSBzZWNvbmQgcmlzY3ZfdnJfZ2V0KCkgc2hvdWxk
IGJlIHJlYWRpbmcgZnJvbSB0aGUgY29udGV4dCBtZW1vcnkKPiA+ID4gKHZzdGF0ZSksIHdoaWNo
IGlzIHVwZGF0ZWQgZnJvbSB0aGUgbGFzdCByaXNjdl92cl9zZXQoKS4gVGhlIHVzZXIncwo+ID4g
PiB2c3RhdGUgc2hvdWxkIHJlbWFpbiB0aGUgc2FtZSBzaW5jZSBsYXN0IHJpc2N2X3ZyX3NldCgp
LiBDb3VsZCB5b3UKPiA+ID4gZXhwbGFpbiBtb3JlIG9uIGhvdyB0aGlzIGJ1ZyBpcyBvYnNlcnZl
ZCBhbmQgd2h5IG9ubHkgQ1NScyBhcmUKPiA+ID4gYWZmZWN0ZWQgYnV0IG5vdCB2LXJlZ3MgYXMg
d2VsbD8KPiA+Cj4gPiBGcm9tIGxvb2tpbmcgaW50byB5b3VyIHRlc3QsIEkgY2FuIHNlZSB0aGF0
IHlvdSB3ZXJlIHRyeWluZyB0byBzZXQgYW4KPiA+IGludmFsaWQgY29uZmlndXJhdGlvbiB0byBW
ZXRvciBDU1JzIGFuZCBleHBlY3QgdmlsbCB0byBiZSByZWZsZWN0ZWQKPiA+IHVwb24gbmV4dCBy
ZWFkLiBZZXMsIHRoaXMgaXMgbm90IGhhcHBlbmluZyBvbiB0aGUgY3VycmVudAo+ID4gaW1wbGVt
ZW50YXRpb24gYXMgaXQgd2FzIG5vdCBleHBlY3RpbmcgaW52YWxpZCBpbnB1dCBmcm9tIHRoZSB1
c2VyLAo+ID4gd2hpY2ggc2hvdWxkIGJlIHRha2VuIGludG8gY29uc2lkZXJhdGlvbi4gVGhhbmtz
IGZvciBzcG90dGluZyB0aGUKPiA+IGNhc2UhCj4gPgo+ID4gQWNjb3JkaW5nIHRvIHRoZSBzcGVj
LCAiVGhlIHVzZSBvZiB2dHlwZSBlbmNvZGluZ3Mgd2l0aCBMTVVMIDwKPiA+IFNFV01JTi9FTEVO
IGlzIHJlc2VydmVkLCBpbXBsZW1lbnRhdGlvbnMgY2FuIHNldCB2aWxsIGlmIHRoZXkgZG8gbm90
Cj4gPiBzdXBwb3J0IHRoZXNlIGNvbmZpZ3VyYXRpb25zLiIgVGhpcyBtZWFuIHRoZSBpbXBsZW1l
bnRhdGlvbiBtYXkKPiA+IGFjdHVhbGx5IHN1cHBvcnQgdGhpcyBjb25maWd1cmF0aW9uLiBJZiB0
aGF0IGlzIHRoZSBjYXNlLCBJIHRoaW5rIHdlCj4gPiBzaG91bGQgbm90IGFsbG93IHRoaXMgdG8g
YmUgY29uZmlndXJlZCB0aHJvdWdoIHRoZSB2ZWN0b3IgcHRyYWNlCj4gPiBpbnRlcmZhY2UsIHdo
aWNoIGlzIGRlc2lnbmVkIHRvIHN1cHBvcnQgMS4wIChhbmQgMC43KSBzcGVjcy4gVGhhdAo+ID4g
bWVhbnMsIHdlIHNob3VsZCBub3QgYWxsb3cgdGhpcyBwcm9ibGVtYXRpYyBjb25maWd1cmF0aW9u
IHRvIHBhc3MKPiA+IHRocm91Z2ggcmlzY3ZfdnJfc2V0KCksIHJlYWNoIHVzZXIgc3BhY2UsIHRo
ZW4gdGhlIGZvcmNlZCBzYXZlLgo+ID4KPiA+IEkgd291bGQgb3B0IGZvciB2YWxpZGF0aW5nIGFs
bCBDU1IgY29uZmlndXJhdGlvbnMgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4gQ291bGQgeW91IGFs
c28gaGVscCBlbmZvcmNlIGNoZWNrcyBvbiBvdGhlciByZXNlcnZlZCBiaXRzIGFzIHdlbGw/Cj4K
PiBKdXN0IHRvIGNsYXJpZnksIHRoZSBzdWdnZXN0aW9uIGlzIHRvIGRyb3AgdGhlIFRJRl9SSVND
Vl9WX0ZPUkNFX1NBVkUKPiBlbnRpcmVseSBhbmQgdXNlIG9ubHkgY2FyZWZ1bCB2YWxpZGF0aW9u
IG9mIGlucHV0IHBhcmFtZXRlciBpbiByaXNjdl92cl9zZXQsCj4gcmF0aGVyIHRoYW4gdXNpbmcg
Ym90aCBjaGVja3MuIElzIHRoYXQgY29ycmVjdD8KClllcywgZXhhY3RseQoKPgo+IElmIHRoYXQg
aXMgY29ycmVjdCwgdGhlbiBJIGFzc3VtZSB3ZSBjYW4gcmVseSBvbiB0aGUgc2ltcGxlIHJ1bGUg
RUxFTiA9PSBYTEVOCj4gdG8gdmFsaWRhdGUgdnNldy92bG11bCBzdXBwb3J0ZWQgY29tYmluYXRp
b25zLiBBZGRpdGlvbmFsbHksIHJlc2VydmVkIHZzZXcKPiB2YWx1ZXMgKHNlZSAzLjQuMSBpbiBz
cGVjKSBzaG91bGQgYWxzbyBiZSByZWplY3RlZC4KCkkgYW0gc29ycnkgYnV0IHRoaXMgYXNzdW1w
dGlvbiBtYXkgbm90IGJlIGNvcnJlY3QuIFRoZSBzcGVjIGRvZXMgbm90CnJlc3RyaWN0IGEgMzJi
IG1hY2hpbmUgZnJvbSBzdXBwb3J0aW5nIEVMRU49NjQsIGFjY29yZGluZyB0byBteQpzZWFyY2gu
IFRoZXJlIGlzIGEgd2F5IHRvIGluZmVyIEVMRU4gdGhvdWdoLCBieSBpbnNwZWN0aW5nIGlmIHp2
ZTY0eAppcyBwcmVzZW50IG9uIGlzYS4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
