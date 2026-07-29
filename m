Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA84C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqhrwvH6nLy00Ws4OZP5qMVb+rDivFcj/GEMwQp5ZrY=; b=q/3cvQ6ga+MZlS
	b9k2bBpSRgz0eySD0aR4SHM12R/Sm4HCVWR9wXWOZ0VVdPz48gAX7y5pFuYMmLrgoU9CDQCXyBDDG
	Rr2fVp+P7Xrl/Ps1tj02ocpBBGqkVSY6CSpunt1fZJL+bWxzRjQ02pkr2NqMsKUTnSe/xOHAZQ59I
	qodtXOI908m9jarksnCtb4jDafE7LXUmPACZCda0lzp5msv88/T1SzmBlBn/KwLWBCOybAiKWMthy
	aD1HAZFHEMbDNHTNDrXMZtGTDo/1TVgTB1FK2WOl0nEZ9umaTp6GWRlLYoV7BTMpRJZ6P8QTLRhLo
	hkF3vYM8lZWYnVF3lKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFf-00000007Bkn-2WmU;
	Wed, 29 Jul 2026 08:02:55 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozFd-00000007Bji-1QLw
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:02:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f71156e1aso342162f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785312171; cv=none;
        d=google.com; s=arc-20260327;
        b=XxA0Q/55ZZSt6Uq3mkUql9DRP2n6aD4oVXP09BwTHy3MJmK5HdguOoD+tYAs0zSWsj
         70qW0eOuechETKFDk9mGp4QGh8XnsOO/w9HPL/tx5tqgDdTwdvdIZy9ONk7LCVCjXE7T
         r1kSamJCsPg9nn5J82Kecc/knPlJVnbfxT37JqCaaIxwcQJjr/zQS5S70At0UBEmux17
         YaGGi8KsDT1t4XbUJeHJdCP1ZaA1ZNQgJ75ogQiJB2VFq73IJoQI4lZx9513sN+gOSnr
         Gob5Krgdw24rQNsunk1TJUo42Vi0Ebt2Soj4vnux6zIWqn5h48xm+KD0g8OmaoIfN4cq
         +ytw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        fh=wpaXr+ueABRT8P8rKTAiz9oYASVohA4vxL52DB7+iOU=;
        b=jVeKt8zy/5l005zsJivvVcAs3/RfLB1TZkDASC8eKX7aLnLxh5z6em7i+8zQnHdGd2
         jCYwCocTAv6l1DRSM86JlqmHHWeg+9q3LMgSXmLmP8Jd9eVXvarXlHd16pAcRXZx3kCW
         l2SxPjv/fu9oTjVRJGrLk98ZdbcXvaxXTPTcYiMVTGSRXEF8eO/YgZJ6sHt31KvcyGJV
         WktRQN6WNgshenYWhW4Ssw7aSlnCxhZFOxgQr8D8JazlvCVGrBDr8LW7sDMSHFMf597X
         Ey7C8sCHRNr6DhT12t+Jskkg4y2RoOafAZxWXAu+Tc/wXHky+oEOCUsTFf0fVdOO11Vy
         IBkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785312171; x=1785916971; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        b=k+UBOpklMXHS0vFUQjbsFtm+HIOtBDdz7sVd97KkjkJLhGGr7rezAAJlwvixGgXWo2
         sGy72RQ9txiWP3gh8RWgETnt8Q4az99CKv9Yzp/9mqGoWIDtLIY1j6QN5HT4sPFb0OrL
         hB5RVwsjNnfYzWR6zfovxafwN72owcFf6OS9qzYqeRxQToq6ozGnjE++wspM12ECwg8q
         sD9oJ8DbnAE2qLMPGJzsJ03otCpOYiFi8eMbLWbNNpNi8pmKGpnhBcsEkWKvfh4b3Avl
         u3JVGRwE8SfXMHp/FClcI+yxH2757tm4aPi0I8iUF6a4ddVsSJ5x557bOzTdBc4Zl0jz
         mh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312171; x=1785916971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KUGHARkb/NyRoNdj9PaR5oVTMK44ZfhRPJfOUUN230Q=;
        b=RRZT0S1FBZ9V5kUztCPJbOeZI8o8xHz6jZiH/geniDYlngdnxrtSjor5pW/tUqCP0c
         4uZT0joD8RuCIsCZTzix8ILnk4K8FZpX9rnE8B2KVkU8mRQLEuWKrXC6mbAeS1pNr6jZ
         50Kn9LnLXwW16oY91lC4U1RhZVigBvx4Cf+Fdvmd9F9VOO9mDifWHTEaosUA5tEN/A/3
         5j6pMYIxqNwUvHy/j8xbQECkvqd8IT6oe7DyOM5gy/Ss97CUM3YSziJorSpVDnwnXPcP
         RFqn03+xoZpbj+wZRKc1wimRY/QBlgzjATsVvXbMhGfhXcWsvnWXdQUv/wkXk50kwue3
         paVg==
X-Forwarded-Encrypted: i=1; AHgh+Rqy4/sa7jgxk6x8bxjZs1phPOLZE//zNp5s4VYZdJD1wabJUzmJDJK5Xyli75/UqKB15Rsw4FBycHLf/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqAjGrxajLndKPt8yA4xy6KmBDoMNRamvlrqe9b+NGiJz7b6vy
	Mw2pDuupB9BL1jREmz8IbKpdZ6O/HztqeCaqnmN2d2H7vJpmisMAM5ah4xAag3UA9RrV6pLsQ1r
	Hj3Sb3CzztkkJ3lPyg3UwjBLV5U2kN3aFh7tLBOF9/Q==
X-Gm-Gg: AR+sD10MIaZmjVYOZbSARDvwL23rTjnaUmM1S9f+Oq2sDCmdEAzCZFNJLEXa3Bx8VBd
	OqjokvZPfTLgWQWYICfYxyGABl8h3z9ttEhT0IHJurhhAahSXt0KAK1yJjthN1s9YgnuesSCHQ1
	xYajEftu9e290r3Qn5stdTDPDZuLMfShIIFvUB3ARuNcx5YKq+O1RiMB3fLwbcz2oHRyHp9BedC
	+OwwidM/wKEb2ju/byY5JFCv142XVJVofzwPSbi8h7zbNdjJUVT/2B/9RpWGcXB0gjXZHDFwhJm
	e4duwC5aG5z5daJeRFjlfq5sgqTKBMHeByJbg+U0HGq5v0F0CO3WOi6BBxplLYvN8z64pi9P/xE
	HIYIdGcvGjwXF6PDj3BMYWG5yHQEcCyhhIjKHVd5dIFghxCKBm3xgtC/bCQA/qxM=
X-Received: by 2002:a05:600c:3146:b0:495:4cb6:71cc with SMTP id
 5b1f17b1804b1-496c6413090mr60244765e9.5.1785312171184; Wed, 29 Jul 2026
 01:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260706021154.210289-1-inochiama@gmail.com> <20260706021154.210289-4-inochiama@gmail.com>
In-Reply-To: <20260706021154.210289-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 13:32:40 +0530
X-Gm-Features: AUfX_mwSxFjTy59usX_zUYG_2NAipnz8XUOKZh1hddj4nec-XezM7JKOT1LvP0A
Message-ID: <CAAhSdy3qnvWF1cdxJxnJxR9jf0_BUpKbauNAuJcY_AAVaJw9AQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: KVM: Reset the SBI extension when disable it
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_010253_446307_ECF4526A 
X-CRM114-Status: GOOD (  18.85  )
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCA3OjQy4oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgU0JJIGV4dGVuc2lvbiB2YWxpZGF0aW9uIGNhbGxi
YWNrIGNhbiBvbmx5IGZpeCB0aGUgcGFyYW1ldGVyIGlmCj4gdGhlIGV4dGVuc2lvbiBpcyBlbmFi
bGVkLiBIb3dldmVyLCBpZiB0aGUgZXh0ZW5zaW9uIGlzIGRpc2FibGVkIGFmdGVyCj4gbW9kaWZ0
eSBzb21lIHBhcmFtZXRlcnMsIHRoZSBzdGF0ZSBvZiB0aGUgZXh0ZW5zaW9uIGlzIHN0aWxsIGJy
b2tlbi4KPgo+IFJlc2V0IHRoZSBleHRlbnNpb24gd2hlbiB0aGUgZXh0ZW5pb24gaXMgZGlzYWJs
ZWQgc28gaXQgY2FuIGhhdmUKCnMvZXh0ZW5pb24vZXh0ZW5zaW9uLwoKPiBhIGNsZWFyIGNvbnRl
eHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jIHwgMTAgKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggYjcz
N2U5YTdhMTJhLi4zZWI3YjdjNTcwNTkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMjIxLDYgKzIy
MSw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQg
KnNjb250ZXh0ID0gJnZjcHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gICAgICAgICBjb25zdCBzdHJ1
Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNpb25fZW50cnkgKnNleHQ7Cj4gKyAgICAgICBjb25zdCBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0Owo+Cj4gICAgICAgICBpZiAocmVnX3Zh
bCAhPSAxICYmIHJlZ192YWwgIT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4gQEAgLTIyOSw2ICsyMzAsMTUgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0
X3NpbmdsZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBpZiAoIXNleHQgfHwgc2Nv
bnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RB
VFVTX1VOQVZBSUxBQkxFKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+ICsg
ICAgICAgZXh0ID0gc2V4dC0+ZXh0X3B0cjsKPiArCj4gKyAgICAgICBpZiAoIXJlZ192YWwgJiYg
c2NvbnRleHQtPmV4dF9zdGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRf
U1RBVFVTX0VOQUJMRUQpIHsKPiArICAgICAgICAgICAgICAgaWYgKGV4dC0+cmVzZXQpIHsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBleHQtPnJlc2V0KHZjcHUpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHZjcHUtPmFyY2guY3NyX2RpcnR5ID0gdHJ1ZTsKCkxldCdzIG5vdCBibGluZGx5
IHNldCAiY3NyX2RpcnR5IiB3aGVuIGFueSBTQkkgZXh0ZW5zaW9uIGlzIGRpc2FibGVkLAppbnN0
ZWFkIHdlIHNob3VsZCBzZXQgImNzcl9kaXJ0cnkiIGluIGt2bV9zYmlfZXh0X2Z3ZnRfcmVzZXQo
KSAoanVzdApsaWtlIHdlIGRvIGluIGt2bV9zYmlfZXh0X2Z3ZnRfc2V0X3JlZygpKS4KCj4gKyAg
ICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArCj4gICAgICAgICBzY29udGV4dC0+ZXh0X3N0
YXR1c1tzZXh0LT5leHRfaWR4XSA9IChyZWdfdmFsKSA/Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQgOgo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19ESVNBQkxFRDsKPiAtLQo+IDIuNTUuMAo+
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
