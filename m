Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9919ECD4F39
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1kOM2OcqVtQwhyNwJrXEd+eD79BbKXU8Lz1cfOmFmk=; b=Hze4IZwnoenDrl
	6b+TF6JB6Goe0Pt5zJZ+8J0hWhN52OIOHAlR7k8xPJhbBPPsO7pvSXJ7QT/2rcyRw8hBZKWmd4679
	e+zXYVFjdUUxd3499/dbEzcFETmf1W2rrGuAuBp/i1QUqtxM+77EInVOZZkA+QocjJ0wKTHMd+JNa
	Wz+a0oQNtjVxcyqvrlQP2sS1obR6Sd7nJmKtcAbD/84stQXVHKjgKh01+erv+o2FuelZfUOZaV2Tp
	2kUwYD4LqRRq6AyvyF26q9xVNjvJULtqfiaBeOC59obEjNP04d5uIKa8fsTcSvwFosJoAELVruHxE
	auz7P1qBQiX4yBdxqHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWLP-00000005chl-44qe;
	Thu, 14 May 2026 13:43:19 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNWLN-00000005chN-1K8s
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 13:43:18 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-69489b43d66so2321716eaf.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 06:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778766196; cv=none;
        d=google.com; s=arc-20240605;
        b=kWX2LCfBMkudV4tn9vSUGwRE/+szRqhgT3mxIPdMu5vIBsqO1eKTGxCZUL9s6rWmtD
         UX3Wsm5meVvIBAwpExeF5dQhy2sfKNGjTJetOvMEvQ3ydGPugw9giaR8OQFpHPB5Co7a
         eJkS2npsYXk8tkIIX19P6lqGq+HEyLJ91jZGtIC5vqNVSpdh4lcI8c36ZTgdg7J63dta
         /eZDxmzf1ak/AL06KPFESH07vMGkSV6ilfAhhH78d4nxiSmi47+vfOJyuWNHtFv8Zy9c
         hZLqQsL14DnswIBtPh7Lkon2KwCpvxBDoY9Svc1dVSLVc9uIzQ+95NmUU0etGU9QrAJt
         L/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        fh=q7Jf5nzW74MoNpr2v37Y9PE7u4f58PlDBQO0DfXtPG0=;
        b=QYsff5z/fmAuhVPlzG8lX0yQuXriEl7R63pISCpNGO6MU6AEd6SGr6f7J0Mj5G62wl
         xqTMuXdPn0soOYn/sm1hm4qdprA6VoTIMjf9La6KWb7Uz6mdUI6T30No6ikuGPIgl9uN
         86fQj+04RoQDw0MNaWEiN+ZODllLXpn7WWgOj/bVh8B9uBmtMij4e4J5QSmxDsmJUTH5
         0/i5tKDkEINYFYhT5yMmz4ed5c0vOy+S850DP9HvHWIvv8KqIwMyV8oSCR8umvVJOa0u
         7nSrBMgauazTdlgO7plhqheMZ8RqETrjbJijFeVGUFJp8JZdGihpldlS5nBEit8D1p+x
         QVpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778766196; x=1779370996; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        b=QFpj0UJR8xnehFEmeKuaBKKkcSofpdekgl/BVOkEYsT2kuxHl/pu0Gl1drC34CbhSI
         mhSayLQ/O8IaPfgMe/7ZXNRh9JRRlDZIYG1mieAWy7MFjkAlItvjrbpH/iJjUB8cR+mF
         muEjGc9yjYhVQSJjFfZ+rumFrzJ+K0PHf3UET0NUWSL2/3pAhpBi6CXPsB3yE95w0uSM
         ZeiGTAtofYrQOz6aAXCAbWPEdmMOX4rpESCgqUzeSqQiKW6DAIAHbKksTTOvocbl7z8e
         sdSi/OVsWFwlw0IqzhYmUf/hPucRosnFQD/W9UaZ8l5j7i9aJwsQlh2aB6pMMmFaSn2Q
         ozLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766196; x=1779370996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6d8VthjlyqVFZ52dWXLfCKwuTt5I0MIUqg/9Vw2be8=;
        b=GDEVaotG8nj+fLkQcQMxob8mRL+DnGpUFQdG5i/JMY6ByEBJ5mL7jvPrMsxxaqtRrq
         pZcEayB8YM3ek01pnFDyW1uYpwxiUayx0qIalR/4B4d6h79qcPsKo98ZP9u6A/kBVtya
         dtdzcOxv0FjC/5ZCIXCGh8JpJgFJYJM/DtrW6TukpgA/zQuS2DU2/jfwRksVlKaR6i0x
         fDHVRbJW3sQ69RoG6g4wgawC1QstF4fIBL2wuaoKQ7IP9mzP3dWeTP66t1U3A3NrLFUM
         47RR/sYkwVo15O4ihpnHFZkOw4jY7icLFJ9dqxdqHG+IcpXSDvwMdjyRQgs9MqGhO+pT
         JJlg==
X-Forwarded-Encrypted: i=1; AFNElJ9VBWLAzCYCixn1tLRUAOWAe4rsaduS04FS6xB/VWlHilG1XitdsAtmkzZDorZGimOShaSoD/ShbTaULw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJKw5h4Q7luYLfGC7E6pCxLTADdr/Y5tbw439PyjNvXxrYoBpf
	uDZU371WRSYaSA96ws3+C6avcs9dHMYp/PIbmx14gpG6jHjOQyRYEimv5jkh7TIxI4MnZFNQVKi
	X8B24YZDq7MklcQsSI7Cz6h0iRrESpAHep+YPm34hNA==
X-Gm-Gg: Acq92OHhAoh2M2jIPAQquuJs3Z8/bc+VWYkzkwollxvp0LYEr8jaSF1cDVAnRCyc5z8
	Ds0WxdeKGiaKe8rhdGPWqjDtTAczqZuZ6sRSRYKxmlBk1BV1qJyqF0vt9qXDcO7GSxT5ta3SiiP
	N2il8YyLRUsIS0FeyieGyVZkw1hC9mbdnzSBR9TgmRkLD0OE7VkMJeEPjqDHPDJD/5Gg+L1SY8n
	qKb+YgM1g6QMb0eYFbyhg5Ckf6mo+mX9iV7ctfArOEzMP0AX9I6Bx79nBLQQXg3G7l50pt1qMPr
	3lJLbDFj0pZZh4MqFrRdrDCc69PdAet4CA9Bhcim+qmkwc7lFgiJ7h7rx8umNoWM2bYIjJg7B84
	Zor7leOk+CUc4uBLGsLI+OdnBWFA=
X-Received: by 2002:a05:6820:1525:b0:696:17a7:498c with SMTP id
 006d021491bc7-69b78dd26b8mr4064734eaf.30.1778766196074; Thu, 14 May 2026
 06:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260415220930.287592-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260415220930.287592-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 14 May 2026 19:13:04 +0530
X-Gm-Features: AVHnY4IYOTnFk_hk2daMk_NQTXJRetF68AXlyGAJYT-GkJrVasSFzbM3upXos9s
Message-ID: <CAAhSdy3LpnWtc9iTnND2ez4WK8WJUF_edYaDfD9Nd8_F3dPJFg@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: kvm: return SBI_ERR_FAILURE for PMU shmem OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_064317_360053_FB95C2C2 
X-CRM114-Status: GOOD (  16.22  )
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

T24gVGh1LCBBcHIgMTYsIDIwMjYgYXQgMzo0MOKAr0FNIE9zYW1hIEFiZGVsa2FkZXIKPG9zYW1h
LmFiZGVsa2FkZXJAZ21haWwuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFw
c2hvdF9zZXRfc2htZW0oKSBhbmQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oKQo+IHJl
dHVybmVkIC1FTk9NRU0gZnJvbSB0aGUgU0JJIGV4dGVuc2lvbiBoYW5kbGVyLCB3aGljaCBjYXVz
ZWQKPiBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKSB0byBhYm9ydCBLVk1fUlVOIGFuZCBzdXJm
YWNlIHRoZSBlcnJvciB0bwo+IHVzZXJzcGFjZSBpbnN0ZWFkIG9mIGNvbXBsZXRpbmcgdGhlIEVD
QUxMIHdpdGggYSBuZWdhdGl2ZSBTQkkgZXJyb3IgaW4gYTAuCj4gVXNlIFNCSV9FUlJfRkFJTFVS
RSBhbmQgdGhlIG5vcm1hbCByZXRkYXRhIHBhdGgsIG1hdGNoaW5nIG90aGVyIFBNVQo+IGhhbmRs
ZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21tZW50Lgo+Cj4gU2lnbmVkLW9mZi1i
eTogT3NhbWEgQWJkZWxrYWRlciA8b3NhbWEuYWJkZWxrYWRlckBnbWFpbC5jb20+CgpTcGxpdCB0
aGlzIGludG8gdHdvIHBhdGNoZXMgd2hlcmU6CgoxKSBPbmUgcGF0Y2ggZml4aW5nIGt2bV9yaXNj
dl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oKQoyKSBTZWNvbmQgcGF0Y2ggZml4aW5nIGt2
bV9yaXNjdl92Y3B1X3BtdV9ldmVudF9pbmZvKCkKCk1ha2Ugc3VyZSB0byBhZGQgRml4ZXMgdGFn
IGluIGJvdGggcGF0Y2hlcy4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMgfCAxMiArKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4IGU4NzM0MzBlNTk2
Yi4uZjM2YjA5OWY0NDdjIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTQzNSw4ICs0MzUsMTAgQEAg
aW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgIH0KPgo+ICAgICAgICAga3ZwbXUtPnNk
YXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3NpemUsIEdGUF9BVE9NSUMpOwo+IC0gICAgICAg
aWYgKCFrdnBtdS0+c2RhdGEpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsg
ICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpIHsKPiArICAgICAgICAgICAgICAgc2JpcmV0ID0gU0JJ
X0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiArICAgICAgIH0KPgo+
ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4cGxpY2l0bHkgYXMg
a3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4gICAgICAgICBpZiAo
a3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0YSwgc25hcHNob3Rf
YXJlYV9zaXplKSkgewo+IEBAIC00ODAsOCArNDgyLDEwIEBAIGludCBrdm1fcmlzY3ZfdmNwdV9w
bXVfZXZlbnRfaW5mbyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgc2FkZHJf
bG93Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGVpbmZvID0ga3phbGxvYyhzaG1lbV9zaXplLCBH
RlBfS0VSTkVMKTsKPiAtICAgICAgIGlmICghZWluZm8pCj4gLSAgICAgICAgICAgICAgIHJldHVy
biAtRU5PTUVNOwo+ICsgICAgICAgaWYgKCFlaW5mbykgewo+ICsgICAgICAgICAgICAgICByZXQg
PSBTQklfRVJSX0ZBSUxVUkU7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAg
fQo+Cj4gICAgICAgICByZXQgPSBrdm1fdmNwdV9yZWFkX2d1ZXN0KHZjcHUsIHNobWVtLCBlaW5m
bywgc2htZW1fc2l6ZSk7Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gLS0KPiAyLjQzLjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
