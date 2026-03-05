Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AFCEDEC05
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPLv48vCS4kV+1cTg9FNhJas1QZ5L38hh3xwyl/kIWk=; b=ZhI5f7rM27Qysy
	XUDWb0M6eq/vER7UNArrZ4j/hV7DSZ/q0iC5Sm6SpblJ+7Uotm9iBha1UkHAIA0nPTnKe93vjnr1c
	MO+3IuOqEUIJJXa7OUVk+I0F+7n6lgoqvuKdoGiHifTfJRdvSsVYIyrTW8hOAMs3boRb/mTJeQcp2
	UXm1cjhjYJ2nijYyzt3ptJkxRH60Z0I6YwN7/G96ijiBIS086PKjDvTKWPxZmtc/wi9J/pc7AGWIx
	KU2cKH9PUc91XtinrgLOga3iYq5lF62m8AHVk0liLdnAdy3Ba6GavwU4PX9nHpwK2vQ7xk39QxI98
	bxTqQS9NLekIpjx5DiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8n1-00000001t0z-0DIl;
	Thu, 05 Mar 2026 13:30:55 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8my-00000001t0C-1luK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 13:30:53 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-679f980a239so3741387eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 05:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772717451; cv=none;
        d=google.com; s=arc-20240605;
        b=O2+kmRI9tGMHr8PkjCtwXyDvx75/WMbkxtotUUWTbEoi8rhM3PEsFy8wD0CMW58Gqc
         fBtNxzf88ZGNLcV1P382nD/S/+U6432SLbXzQRw/6zk69it6gV1H/AStHvbe6yXBCJ1T
         mG84m3WPGAF8ao7VMOaGp5PzQdYTmkYLLlQENFxEzFMJ5h9ImokOAoWPc13p3S947Plk
         Ia8bZzoOcNFDX9dianhkitmbuLhuWgjGrIMIfHD7F2UMSUE8CUOKk5Bj5hkMGu9+eIG4
         QkeO/lao/Yigh8YYStGv4Qx7plBjxpA9kguGOtwTrlIfDJZNhSq/y1TtRCiiPbiMhxHp
         ESFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        fh=yLa59zdS3Htbm4HQWkgXvfpD4mLICDQA7LRb/r9YgG8=;
        b=chqxNVnejT7UTEbYiMWTMs8gOBB3ts4/tWBBLOTQiJ5sHXtDlobkHe+qwtHOrwf8m8
         OcvkQtVtNxx2pq1EYrhPsCwGl76k9BhJjdCtasMHFHBomy6VhgWfWBDSP7nGtRVmD7f5
         olHeMUOVn/0vsmeHjpg7utDsjcQRNyK2ZL8kBhGyg0Ahs/Pe1i1WEdpneVfwCiocNiqD
         TuK38T99ZldK0OafmyD1O4yAnTWj+UWAPnSuDKcTwRXnzSijZtpdc5bOn/xoVNzkp09a
         Hlv/J+0oyBfXwzqss//thp6AF2um0zUUkV6GHizhFIFrrAURTAD3y9tXk8/Oj/gkx/tP
         6X2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772717451; x=1773322251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        b=tFkR9WtPt95n754c5GbmQGRDnK9rDiwW+LgVbC3Tdtja/qCctTay2lLttzSYwLnbaM
         bBnOCeklUE2kEkhR4AVlpKqbaj1qpkVlKDKi8DKU51qjF2xXKE3KOfnYnpZVxzlBA6gc
         qsPYEYlzMhdjpURXIJkvQzVGMSeNLntKtzPV8uklGVbNkMbwPFFbPrinC24ZNUqQzB1Z
         HyMrWHxbhMgaEFAN+LUaSC2NJAMCol7hBQa0mpR7lvR8W65LOFNjdh26AfjnRgPkEHq/
         EMjnEMpoC/iyWQpxztQ/q/C6W2SYdoVVrAlMWAe0SrV4B2toZEU/2Ta0Kmq9p9HDLWV+
         Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717451; x=1773322251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HeQt/T2ObEDlxLbQETck0lulq4qla31hbkK+l9bn/Ho=;
        b=XqHKi5hUSPJJdWGNkDNzlkPZFpRVXFcbKfgAi5vn3eM9C9yrJRiTCRufl+i1FviHHO
         R/IdQcbO4idHuT1pHCOuB6blXXA8kTwDSZaZX3fcSaolHaAyqjdQYEb7VXMa/HS1TKru
         nVG80Qx0fPx5dVnJpeXL84oNcLF8RvCkWUiN6YTcyCnxyQ9+5lg5OlPsV+HDBfgIlyeB
         u8R4Ss0TL4vn6VB5TtADF3ShpHdiCgjwIkmPxRSjw62WjfXn+L+Mr3US1eDdtNotLy4d
         IANlz1LjIGG70ASH3GR9c7qcBmMGnZPjHX2sR5u9WBjM8ys+YbcYUJWJGTpEaJSlS61U
         DSZw==
X-Forwarded-Encrypted: i=1; AJvYcCVTqcCcJr2biyZigLAJI2xh6whPuCp4GZMrlBfNy6lio93OEGPXLzSHDWhssjNcK7aDI4fvNf3/KpPTEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNQCGdHWZpMj2eDUJ5tk4Nj7iTNYXxtXwrJlaNMO3aAwVZ2I4p
	b4q5rQvs+9+czV2cgpowAfriEZbrJhysDKCVUQn+KaljyiTkUWR4F3AcNpLdz57OW/9BUE2b3jc
	Y3dKniz8Cex38utGhUPxbadkr23uGWKI/L1GMEY0Inw==
X-Gm-Gg: ATEYQzzcbv5FmDnX4eHuJ0xO3p3Hv9MfeqMBUE70fT0KvlfOV72OyAmrv7VRx6KiMje
	CftKxOBO/w6P4p+evYyVlYRazCCjAXXnHUUnL+cgMz8M7j/YtN9sy4c73sNrmF5nB8sNdioh7IK
	FD3yzLaGvSp4V6Wkb+ot/+0rj7Gms28uJ1lBQ9prQ7dJBf0jp8dQLvoaRVKR85MdORc4MBBIXSX
	96NYIh6hSvgUUJ1jdhRlcJzo1Wc1RJ+HdGxGAnutpIkm5DA/QfN7xFcPVil3AcxVw8fzP1r7e+6
	TfvrhY1/uqxRN3d4L3U7LnESd3xWcXCUwyy5zzxAwDP8rLOknSUuScYwH1+fQpiVIJLKrBPpt2+
	DBaTneSRa3so+fIvfqvDBewkLOA==
X-Received: by 2002:a05:6820:4c14:b0:66e:61cc:80e9 with SMTP id
 006d021491bc7-67b177492dfmr3329436eaf.47.1772717450875; Thu, 05 Mar 2026
 05:30:50 -0800 (PST)
MIME-Version: 1.0
References: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260304080804.2281721-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Mar 2026 19:00:38 +0530
X-Gm-Features: AaiRm52bujvrz1wVs7wPhlkcz9NjaN9CVJbTQxzpaKmaFZPorRalJg79gkEOupo
Message-ID: <CAAhSdy0zfm19ucQ3c354VZ5RDEN+ztG1ZRHzVReGYAXS+aid_g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix potential UAF in kvm_riscv_aia_imsic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_053052_717630_30655FED 
X-CRM114-Status: GOOD (  21.13  )
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxOjM44oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIEtWTV9ERVZfUklTQ1ZfQUlBX0dSUF9BUExJQyBi
cmFuY2ggb2YgYWlhX2hhc19hdHRyKCkgd2FzIGlkZW50aWZpZWQKPiB0byBoYXZlIGEgcmFjZSBj
b25kaXRpb24gd2l0aCBjb25jdXJyZW50IEtWTV9TRVRfREVWSUNFX0FUVFIgaW9jdGxzLAo+IGxl
YWRpbmcgdG8gYSB1c2UtYWZ0ZXItZnJlZSBidWcuCj4KPiBVcG9uIGFuYWx5emluZyB0aGUgY29k
ZSwgaXQgd2FzIGRpc2NvdmVyZWQgdGhhdCB0aGUKPiBLVk1fREVWX1JJU0NWX0FJQV9HUlBfSU1T
SUMgYnJhbmNoIG9mIGFpYV9oYXNfYXR0cigpIHN1ZmZlcnMgZnJvbSB0aGUgc2FtZQo+IGxhY2sg
b2Ygc3luY2hyb25pemF0aW9uLiBJdCBpbnZva2VzIGt2bV9yaXNjdl9haWFfaW1zaWNfaGFzX2F0
dHIoKSB3aXRob3V0Cj4gaG9sZGluZyBkZXYtPmt2bS0+bG9jay4KPgo+IFdoaWxlIGFpYV9oYXNf
YXR0cigpIGlzIHJ1bm5pbmcsIGEgY29uY3VycmVudCBhaWFfc2V0X2F0dHIoKSBjb3VsZCBjYWxs
Cj4gYWlhX2luaXQoKSB1bmRlciB0aGUgZGV2LT5rdm0tPmxvY2suIElmIGFpYV9pbml0KCkgZmFp
bHMsIGl0IG1heSB0cmlnZ2VyCj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2NsZWFudXAoKSwg
d2hpY2ggZnJlZXMgaW1zaWNfc3RhdGUuIFdpdGhvdXQgcHJvcGVyCj4gbG9ja2luZywga3ZtX3Jp
c2N2X2FpYV9pbXNpY19oYXNfYXR0cigpIGNvdWxkIGF0dGVtcHQgdG8gYWNjZXNzIGltc2ljX3N0
YXRlCj4gd2hpbGUgaXQgaXMgYmVpbmcgZGVhbGxvY2F0ZWQuCj4KPiBBbHRob3VnaCB0aGlzIHNw
ZWNpZmljIHBhdGggaGFzIG5vdCB5ZXQgYmVlbiByZXBvcnRlZCBieSBhIGZ1enplciwgaXQKPiBp
cyBsb2dpY2FsbHkgaWRlbnRpY2FsIHRvIHRoZSBBUExJQyBpc3N1ZS4gRml4IHRoaXMgYnkgYWNx
dWlyaW5nIHRoZQo+IGRldi0+a3ZtLT5sb2NrIGJlZm9yZSBjYWxsaW5nIGt2bV9yaXNjdl9haWFf
aW1zaWNfaGFzX2F0dHIoKSwgZW5zdXJpbmcKPiBjb25zaXN0ZW5jeSB3aXRoIHRoZSBsb2NraW5n
IHBhdHRlcm4gdXNlZCBmb3Igb3RoZXIgQUlBIGF0dHJpYnV0ZSBncm91cHMuCj4KPiBGaXhlczog
NTQ2MzA5MWE1MWNmICgiUklTQy1WOiBLVk06IEV4cG9zZSBJTVNJQyByZWdpc3RlcnMgYXMgYXR0
cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWpp
YWthaTIwMjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQ
ZWFudXRAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4IGZvciBMaW51eC03LjAtcmNY
CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgfCA1
ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jpc2N2
L2t2bS9haWFfZGV2aWNlLmMKPiBpbmRleCBmYjkwMTk0N2FlZmUuLjlhNDVjODUyMzlmZSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2t2bS9haWFfZGV2aWNlLmMKPiBAQCAtNDcxLDcgKzQ3MSwxMCBAQCBzdGF0aWMgaW50IGFpYV9o
YXNfYXR0cihzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2RldmljZV9hdHRyICph
dHRyKQo+ICAgICAgICAgICAgICAgICBtdXRleF91bmxvY2soJmRldi0+a3ZtLT5sb2NrKTsKPiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICBjYXNlIEtWTV9ERVZfUklTQ1ZfQUlBX0dS
UF9JTVNJQzoKPiAtICAgICAgICAgICAgICAgcmV0dXJuIGt2bV9yaXNjdl9haWFfaW1zaWNfaGFz
X2F0dHIoZGV2LT5rdm0sIGF0dHItPmF0dHIpOwo+ICsgICAgICAgICAgICAgICBtdXRleF9sb2Nr
KCZkZXYtPmt2bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIHIgPSBrdm1fcmlzY3ZfYWlhX2lt
c2ljX2hhc19hdHRyKGRldi0+a3ZtLCBhdHRyLT5hdHRyKTsKPiArICAgICAgICAgICAgICAgbXV0
ZXhfdW5sb2NrKCZkZXYtPmt2bS0+bG9jayk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICAg
ICAgICAgfQo+Cj4gICAgICAgICByZXR1cm4gcjsKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
