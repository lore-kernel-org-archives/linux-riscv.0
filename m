Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45790606A331
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z04hBmu+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=b1ehhVbL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ilpvpH6KqaiM6BhcJYC/nqo9faxDpXhwub0dUtLtjVY=; b=Z04hBmu+jSVLWLaQr0G/6B8u4P
	6KpUHzAtBsFGKQDkcCq68MyDjZyqleu7H7jLdDGnMTs0864aZcmBE8EzCVZg2Jhd5Mxn/jhosg3Rs
	UPpdnBI3Xb3WvvEZj/LiLeu7X9Mx1ZIE/Q+3U4ygUpomBwYbDDPOHKV/N+YnunLEkzARP2NqUaewH
	S0+dbG+qYVz/IiDOSO+kzCEdba+pNEfzU4jZ1FZxPBgiqw7mZ53LCDzogpTnqhovvmzs+EAFoDv0I
	pAzgg3FuvmfGqa4/RMkGQjRvw3j//3tCov82IMwoULDfTsCZjPKS/SKfrzfmPrWEtoMu2NWnjSygx
	SpA0datg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcnH-00000002K1H-2sQY;
	Tue, 10 Nov 2026 03:45:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcnF-00000002K0E-3ARa
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 03:45:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-490585eddfcso1238044f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 19:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794282306; cv=none;
        d=google.com; s=arc-20260327;
        b=iR2RGf7P+GDmuhi2iGFCryo3qw3By9jK91GyyrftcpBJtkmAF8Iqzw328LZMTSZ8c5
         uLSFqn9zUlPEVaUP5BjcgiHOKo9xtkdu9BdazaxHt47RgaT1bdg7Fa9sf6GQRQdwUsgu
         2vuDT11HG4i2L9Cj2j7vhERXrzzEPM2uxHVFD56KoWipEZXNNf6ZgaHnO4FCfud0E6lV
         W36OCkmMSkXcGm3uFOcwumIZTTN0wcLs/l81thrvst6B8PE1v9HY2H2AOe3BqgM3jy6n
         YUBqof6IDaIf7Z/rSCwAGJNExvHE+FzNf/n7nf0wnrZmFbyxsmnh1tVvOt/Y7GMcant6
         zRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        fh=isHChfjsSiyjhalyF8Nwbe9RG4zlUcjE/elW/JGx6Ao=;
        b=I/bIrtMVimzxmPMOrRnkB132vnPepJAbzEnFdjKOYyU4ob74R40ARuHd2BiUFRuOII
         fAAr1zJ8rKexONP9KW4kHytVAdiYu8RdD74uKBqg5azzw4TOUDLdT5KhNusUy+JdWe9J
         MFziJ2a2uT9Mc8CWkWLy4h0O5/8SIXpIGTa58i2/wrIR9Rx0BOfz//q8yXaJ5Mrr0JNE
         ZzSu7EFhl/42vWZRfwHSQLTKfAtf9NWe7ckgM2xRNVHRrvIwjq69U2AI7t6I76RrVvVR
         7qMA7SAdgcG8lX1YLSldB9eEi0jHNqFD6RNYGO4Aj+2fFq4jd5thug+rWl8+KINEOKIz
         Iasw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794282306; x=1794887106; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=b1ehhVbLEPYcYXGbKxURHbl/CNc28APwxyyBIIA16mipOUmzBaHHZa4aW7UtMELo8c
         a5TI2HvZkKR1CCHY76oCkY1Srbux/ba+LRqg70OWVUBUx3q0teKwDlhzFFimAfiFRGBR
         XmMqNcCiQuXtGQpxsUc3apCZS2uJC6bnlLXC1UvmHfL8MrX+bzmOhobKV4kUnvKhmbPz
         8h5i88VF+2LbFlCYU0/QLinOI3eJrc8ojs0JqQfguVFVIWsQE5CvNUS6eeuZwpw+FnU4
         0w8WTfCWw5hCds/RTv28z/d81w/TMEUGMEUkA7cqk+JdjNVoPrUbNznFzoEC62chycMZ
         WdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282306; x=1794887106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mDyPcBarqrkxPjTC16S8+UW/cTA1USsfs9afFvxLu4=;
        b=YEd5jDLveQkm2OVRQH+z9+Ks3xeLyvydsE/fJHuQSDnIaqjzzWxd+qs78iUpNoErAA
         +HpwkpPuI50gNJjLSHcciz9f85JrMTUlkfm4QsPjmm85YGmSY7Ny8AmF0ODGOyz+V71K
         5amBA21NbMyurKUIFnfYfAI3gqu5NttajWkAJForpaN8wfV9mixpJgpjODqSbPErXNJx
         CwFqqKcIGpizydc8MvfBrG5VMWjqaEPWNm3W89gyh6zcH5RWc6aSkLKnT3eQ6ZJVviCu
         rsdpmhokmH6T95/07Deh/B3nUf+9MSN9NBDkgPYlFg/lwa7b7MyncyiGkWlWjsFzhsaQ
         Ff8g==
X-Forwarded-Encrypted: i=1; AL+hErEaLoRvlzWnD4ze3Bibct6nylIbTeiPXP1ynibWYWsiL0hKlNaEMfbZBeAzLUEFjLCvKKNI+Uu+HIjfOQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+33X/KY10nEznHIYn5wqWhvHw+YUx4JHB5Y5lMsx7ghcv/yapu
	VrwViN8ga5h4ZXL4tnzKZEq95UpJANp+UrrxHYAkQbe6yEirM9o6jb8Y9EnRXOwxUNpQbPSbH5G
	A//Kg/m9P8PBcYBHI4FC1u2gomEaWReX5h5MmcCu77A==
X-Gm-Gg: AYBFou2TXBktbS4B847zkdt/Dby0FbTbbLWXxeEeETUU6+TN1w9kCBzDD42UlJ1+pLs
	dMEfgClmxzFpQpFK3thwQSUUJ2wDmJzCOpciko7EIUYzXreow0ANhCSO5q5rf+Yn048Gbfk/PPS
	aiPytGs5QZsrxiXk3hvF0mRJOi6G2pn7qBqCvUyc1IsnE/fOpxyY2xVh0iCY2fbQOIEbD7IBQYM
	CTvonzo6m3dn5PIwTAxgfcHW8ldHytnjeBXk7rmJPPahfSRFbQzT5uqM9k2eiY5OmukDvIF8iVb
	Pia0lNA1QIp28aY1DAhNWXK8CG8yNphs1IcCjDdGdhgVt/vl+mAl69MnF/c+XQ6l0lVELsHiF+m
	arTh8xsrtP7ESeXQL1dkwkMNY6W+qCzkPHkVSZs/Isf+JdXj+ZZsVu2V5p9WSwP20T++NIM15uN
	96A2EekJeiu7azq0GdH5DrVkbYvrklugfgfc8Decy+JBbgC70RUixydDr/
X-Received: by 2002:a05:6000:2289:b0:492:7efe:3fc4 with SMTP id
 ffacd0b85a97d-4982f2b5c0emr2318492f8f.21.1794282305918; Mon, 09 Nov 2026
 19:45:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260930150213.799245-1-anup.patel@oss.qualcomm.com>
 <20260930150213.799245-4-anup.patel@oss.qualcomm.com> <CABb+yY0gLY8VuY0pDKKm4EfS3wp3buLgF=waajaA7JD0UX-VwQ@mail.gmail.com>
 <CABBgwmsU9S2kf+RL53G8Tk4ar3=6f1zMTss_HmE42fxiwxVFpQ@mail.gmail.com> <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
In-Reply-To: <CABb+yY0SZuCQoLF65EGY0=R4=p7fO3SU53pPhT1cgAj26u8gNA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Nov 2026 09:14:54 +0530
X-Gm-Features: AclHuK_CabJq9g7mN5dukuhLCdD0ZSMtx534VbUmKJCoEfUVtt5Yuwt6FlaPoos
Message-ID: <CAAhSdy1dfRf97FACz-1hDaTJzB0jR2exXsWg+ttGCtbUmqmrcw@mail.gmail.com>
Subject: Re: [PATCH 3/4] mailbox: add direct synchronous send support
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Doug Anderson <dianders@chromium.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rahul Pathak <rahul@summations.net>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Himanshu Chauhan <hchauhan@ventanamicro.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_194509_826937_F018E66D 
X-CRM114-Status: GOOD (  36.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgOSwgMjAyNiBhdCA3OjE54oCvUE0gSmFzc2kgQnJhciA8amFzc2lzaW5naGJy
YXJAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgT2N0IDI5LCAyMDI2IGF0IDc6MjfigK9B
TSBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+
IEhpIEphc3NpLAo+ID4KPiA+IE9uIE1vbiwgT2N0IDEyLCAyMDI2IGF0IDU6NTLigK9BTSBKYXNz
aSBCcmFyIDxqYXNzaXNpbmdoYnJhckBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBX
ZWQsIFNlcCAzMCwgMjAyNiBhdCAxMDowNuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3Nz
LnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBGcm9tOiBBbWlycmV6YSBaYXJy
YWJpIDxhbWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBT
b21lIG1haWxib3ggY29udHJvbGxlcnMgY2FuIGNvbXBsZXRlIGEgdHJhbnNhY3Rpb24gZW50aXJl
bHkgd2l0aGluCj4gPiA+ID4gdGhlIGNhbGxpbmcgY29udGV4dCwgd2l0aG91dCBnb2luZyB0aHJv
dWdoIHRoZSBxdWV1ZWQgVFggc3RhdGUKPiA+ID4gPiBtYWNoaW5lIG9yIGEgVFgtZG9uZSBpbnRl
cnJ1cHQuIEFkZCBhIHN5bmNocm9ub3VzIHNlbmQgcGF0aCBzbyB0aGVpcgo+ID4gPiA+IGNsaWVu
dHMgY2FuIHJlcXVlc3Qgb25lIGFuZCB3YWl0IGZvciB0aGUgcmVzdWx0IGRpcmVjdGx5Lgo+ID4g
PiA+Cj4gPiA+ID4gQ29udHJvbGxlcnMgYWR2ZXJ0aXNlIHN1cHBvcnQgdmlhIHRoZSBuZXcgc2Vu
ZF9kYXRhX3N5bmMoKSBvcCBhbmQKPiA+ID4gPiBjbGllbnRzIG9wdCBpbiBieSBzZXR0aW5nIHR4
X3N5bmMgd2hlbiByZXF1ZXN0aW5nIHRoZSBjaGFubmVsLgo+ID4gPiA+Cj4gPiA+ID4gQ2hhbm5l
bHMgYm91bmQgdGhpcyB3YXkgbXVzdCBub3QgY2FsbCBtYm94X2NoYW5fdHhkb25lKCkgb3IKPiA+
ID4gPiBtYm94X2NsaWVudF90eGRvbmUoKSwgYW5kIG1ib3hfc2VuZF9tZXNzYWdlKCkgYW5kIG1i
b3hfZmx1c2goKSBub3cKPiA+ID4gPiByZWplY3QgdGhlbSwgc2luY2Ugb25seSBtYm94X3NlbmRf
bWVzc2FnZV9zeW5jKCkgaXMgYSB2YWxpZAo+ID4gPiA+IHRyYW5zbWl0IHBhdGguIFRoZSBjbGll
bnQgcmVtYWlucyByZXNwb25zaWJsZSBmb3Igc2VyaWFsaXppbmcgY2FsbHMKPiA+ID4gPiB0byBt
Ym94X3NlbmRfbWVzc2FnZV9zeW5jKCkgYWdhaW5zdCBtYm94X2ZyZWVfY2hhbm5lbCgpLgo+ID4g
PiA+Cj4gPiA+IFNlZW1zIGxpa2UgeW91IHdhbnQgdG8gdXNlIG1ib3hfY2xpZW50LnR4X2Jsb2Nr
Lgo+ID4gPgo+ID4KPiA+IEFwb2xvZ2llcyBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UsIHRoZSBw
YXN0IG1vbnRoIEkgd2FzIHRyYXZlbGxpbmcKPiA+IGZvbGxvd2VkIGJ5IHRoZSBMaW51eC03LjQg
bWVyZ2Ugd2luZG93Lgo+ID4KPiA+IFdlIGhhZCB0cmllZCBtYm94X2NsaWVudC50eF9ibG9jayBt
ZXRob2QgaW4gdGhlIHBhc3QgYW5kIHdlIGhhZAo+ID4gZm91bmQgaXQgdG8gYmUgbm90IHN1aXRh
YmxlIGJlY2F1c2UgdGhlIG1ib3hfc2VuZF9tZXNzYWdlKCkgd2lsbAo+ID4gdXNlIHdhaXRfZm9y
X2NvbXBsZXRpb25fdGltZW91dCgpIHdoaWNoIGNyYXNoZXMgd2hlbiBjYWxsZWQgZnJvbQo+ID4g
YW4gYXRvbWljIChub24tc2xlZXBhYmxlKSBjb250ZXh0LiBPdXIgZXhpc3RpbmcgbWFpbGJveCBj
bGllbnRzIChzdWNoCj4gPiBhcyBzeXN0ZW0gbXNpLCBjbG9jaywgZXRjKSBkbyBtYWlsYm94IHRy
YW5zZmVycyBpbiBhbiBhdG9taWMgY29udGV4dC4KPiA+IER1ZSB0byB0aGlzIHJlYXNvbiwgY3Vy
cmVudGx5IHdlIHNldCBtYm94X2NsaWVudC50eF9ibG9jayA9IGZhbHNlICYKPiA+IG1ib3hfY2xp
ZW50Lmtub3dzX3R4ZG9uZSA9IHRydWUgaW4gYWxsIG91ciBtYWlsYm94IGNsaWVudCBkcml2ZXJz
Lgo+ID4KPiA+IFVzaW5nIG1ib3hfY2xpZW50LnR4X2Jsb2NrID0gZmFsc2UgJiBtYm94X2NsaWVu
dC5rbm93c190eGRvbmUgPSB0cnVlCj4gPiBzdGlsbCBkb2VzIG5vdCBhdm9pZCB0aGUgc3Bpbmxv
Y2sgc2VyaWFsaXphdGlvbiBlbmZvcmNlZCBieSBtc2dfc3VibWl0KCkKPiA+IGZ1bmN0aW9uIHdo
aWNoIHdvcmtzIGZpbmUgYnV0IGFkZHMgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgYW5kIHByZXZlbnRz
Cj4gPiBwYXJhbGxlbCBtZXNzYWdlIFR4IGZyb20gbXVsdGlwbGUgQ1BVcyB0byB0aGUgc2FtZSBT
QkkgTVBYWSBtYWlsYm94Cj4gPiBjaGFubmVsLgo+ID4KPiA+IFRoZSBTQkkgTVhQWSBtYWlsYm94
IGNvbnRyb2xsZXIgZHJpdmVyIHNpbXBseSBzZW5kcyBtZXNzYWdlcyB0bwo+ID4gaGlnaGVyIHBy
aXZpbGVnZSBmaXJtd2FyZSB1cG9uIFR4IHVzaW5nIFNCSSBjYWxscyBhbmQgd2hlbiB0aGUgY2Fs
bAo+ID4gcmV0dXJucyB0aGUgcmVzcG9uc2UgZGF0YSBpcyByZXR1cm5lZCB3aXRoIGl0LiBBbHNv
LCB0aGVyZSBpcyBubyBUeCBjb21wbGV0ZQo+ID4gaW50ZXJydXB0LiBUaGUgaGlnaGVyIHByaXZp
bGVnZSBmaXJtd2FyZSBtYXkgZm9yd2FyZCB0aGlzIG1lc3NhZ2UgdG8gYQo+ID4gbWljcm9jb250
cm9sbGVyIG92ZXIgUlBNSSBxdWV1ZXMgT1IgaXQgbWF5IGNvbnRleHQtc3dpdGNoIGFuZCBmb3J3
YXJkCj4gPiB0aGlzIG1lc3NhZ2UgdG8gYSBzZWN1cmVkIGRvbWFpbiAoZS5nLiBPUC1URUUpIHRv
IHByb2Nlc3MgdGhlIG1lc3NhZ2UuCj4gPiBUaGUgaGlnaGVyIHByaXZpbGVnZSBmaXJtd2FyZSB0
YWtlcyBjYXJlIG9mIHRoZSBzZXJpYWxpemF0aW9uIGFuZCBhbHNvIGFsbG93cwo+ID4gcGFyYWxs
ZWwgU0JJIE1QWFkgY2FsbHMgZnJvbSBtdWx0aXBsZSBDUFVzLgo+ID4KPiA+IFRoZSBNQk9YX1RY
RE9ORV9CWV9SRVRVUk4gYW5kIHNlbmRfZGF0YV9zeW5jKCkgY2FsbGJhY2sKPiA+IGFsbG93cyB1
cyB0byBhdm9pZCB0aGUgVHggcXVldWluZyBhbmQgImNoYW4tPmxvY2siIGZvciBTQkkgTVBYWSBt
YWlsYm94Cj4gPiBjaGFubmVscyBzaW5jZSB0aGlzIGlzIGFscmVhZHkgdGFrZW4gY2FyZSBvZiBi
eSB0aGUgaGlnaGVyIHByaXZpbGVnZSBmaXJtd2FyZS4KPiA+Cj4gMSkgWW91ciBjbG9ja3MgY2Fu
J3QgcmVhbGx5IGV4cGVjdCB0byBiZSBhdG9taWMgIC0KPiBycG1pX2Nsa19lbmFibGUvZGlzYWJs
ZSBhcmUgcHJlcGFyZS91bnByZXBhcmUgY2FsbGJhY2tzIHdoaWNoIGNhbiBiZQo+IGNhbGxlZCBm
cm9tIGEgc2xlZXBhYmxlIGNvbnRleHQgYW55d2F5Lgo+IDIpIFN5c3RlbS1NU0kgaXMgYSBnb29k
IGNhbmRpZGF0ZSB3aGljaCBtYWtlcyBtZSBub3RpY2UgdGhlIHNobWVtIGlzCj4gcGVyLWNwdSBz
byBjdXJyZW50bHkgYSB3aWRlci1zY29wZWQgY2hhbm5lbCBsb2NrIGlzIHByb3RlY3RpbmcgaXQu
IElmCj4geW91IHdhbnQgbG9jay1mcmVlIGFjY2VzcyB0byB0aGUgY2hhbm5lbCB5b3UgbmVlZCB0
byBndWFyZCBzaG1lbQo+IGFjY2VzcyB3aXRoIGxvY2FsX2lycV9zYXZlL3Jlc3RvcmUgd2hpY2gg
aXMgYW55d2F5IHdoYXQgc2hvdWxkIGhhdmUKPiBiZWVuIGRvaW5nLgo+Cj4gRm9yIHRoZSBzeXN0
ZW0tbXNpIGNhc2UgSSB0aGluayB0aGUgZnJhbWV3b3JrIGNhbiBiZSBtb2RpZmllZCB0bwo+IHN1
cHBvcnQgaXQgYmV0dGVyLiBJbnN0ZWFkIG9mIGEgcHJvbG9uZ2VkIGJhY2stZm9ydGggSSBoYXZl
IGRyYWZ0ZWQKPiBbMV0gc3VwcG9ydCBmb3IgYSBuZXcgbG9ja2ZyZWUgYXBpIGFuZCB0aGUgc2Vt
YW50aWNzIGRvY3VtZW50YXRpb24sCj4gYmVjYXVzZSBJIGFsc28ga25vdyBob3cgb3RoZXIgcGxh
dGZvcm1zIG1heSBiZW5lZml0LiBQbGVhc2UgZWl0aGVyIGFkZAo+IHBpZWNlcyBmcm9tIGl0LCBv
ciBldmVuIGJldHRlciBvd24gaXQsIGFkYXB0IGl0IGFuZCB0ZXN0IGl0IGJlZm9yZQo+IHN1Ym1p
dHRpbmcgKGV2ZW4gcmVwbGFjZSBteSBzLm8uYiBpZiB0aGUgYXV0aG9yIHdhbnRzKS4gVGhhdCB3
aWxsIGJlCj4gdGhlIGxlYXN0IGVmZm9ydCBmb3IgYWxsIG9mIHVzLgoKVGhhbmtzIEphc3NpLCB5
b3VyIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lLgoKSSB3aWxsIGluY2x1ZGUgeW91ciBwYXRjaGVz
IGluIHRoZSBuZXh0IHJldmlzaW9uIGFuZCBhbHNvIGVuc3VyZSB0aGF0CnRoZXNlIHBhdGNoZXMg
d29yayB3aXRoIGN1cnJlbnQgUlBNSSBkcml2ZXJzLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
