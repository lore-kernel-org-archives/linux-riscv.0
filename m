Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3EDCD3424
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KH5qQyA7Mo5i2xb8epFHcQIFb/03vvcJ7BQ/R7Zti9o=; b=Ywfo6g1g7jZYN3
	yGCVpuh87FCwsZ7qNfhgATL1/V/SGGfcDGTo+aCymPPsEujBDfg+ER4Zl34ZcY1tjKjMaooB3Fack
	HxA+pgQb/L9Jv3j8dfDn9/+EcfCXToFNjzQ6muuihgsvAtmKGs5dvmolJ5M4Tb5gT+agvDp6CjbQz
	Y6g1648A86QB+ha4GFFxFo9n9k2X0qYyChvNap/BWm599pedb0nl+NiaSU3Ls9MBgi3dKFdW7RL3a
	cTkVU/TW50FyDBwyHV2dXCAPGZfcLPNQjHaqRvcZb9H0X2EeKuA9jxpI6yXOZcUxZDtJr6xYcWN+e
	VAn6H/O586THIuzTL09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZQ8-0000000BH1B-3IYH;
	Sun, 03 May 2026 16:11:52 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZQ5-0000000BH0U-21OI
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 16:11:50 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-40f0e14b9f9so2450814fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 03 May 2026 09:11:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777824707; cv=none;
        d=google.com; s=arc-20240605;
        b=U3c5Bd35Kr4klI1xeGv80wnJ8cI887GWP2mD4NUyJ5Abji5cic9xeacmj+DEBNUcFo
         jT5c80X15n1XklCm1kTcFvFxkGYldHm7/H3GmCxsM0SStGRDEGeL+M2Td4h8sb9jIM7T
         T0F/eP4b4BALSbpkjxE+2chvJlNFMkQCX7l/zSYxnrrbDQrXThl+s06LZe/xlWTf3eGM
         CmxD2lh+bvdcYPFYNQpvz5x3+iFCK0R1qwP0epk92Xq79yTu0Bn0fMqwFwv2HGH6yh19
         Q+BiK6+LhXH4XiR/RWZEhFVF4flhW0Qh7wQ8xlmyMJ0RRJzJIfnt0mg7jUUnYXpcnmXK
         P+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VzxOxsGcFm211D/OgKdeeQ+aVWqj1QWVrx9oBqAxphU=;
        fh=zim6cwgClCK4hc3fEh2Dw1DIa5Uu1jeSIvYE/0wzXuo=;
        b=PXjwGTITNOLliAb5AvObm0YDOxOViJRrjPGX1Opq4rDXAO+RKBkRB8cMejpymys9WQ
         ZTi4ZzJZcMy3CAkmyqnhwzkeMGcuuw8Ortq+HZ1KtvEkKpjjjnmadidLNSjdlVAMq5HA
         VOayhrWKbiDPeTZLXZhGijqJM9ex9POPJQFlSoZv8vA9mFgK64fI7m+ls/EjXqibzP11
         k55s/kj1q16lsq34Iz/qSq7W+ibEmsxhwTDVw6XujCX/IOEfpRJKjfQbc0JWSRzGCVJ1
         fMBzLQv5zb3lAmSFWK2eu9qcpCS2VlrTuOCVnXcoT4qOtjINgP6NwQMIqx88f9ctPa/M
         URvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777824707; x=1778429507; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzxOxsGcFm211D/OgKdeeQ+aVWqj1QWVrx9oBqAxphU=;
        b=f/X5yCJpbmt2++bGLyY7imf/Lh4lpAknN7OCnrXLlg7EKLnvcXppOLeJF6vf3O0tIe
         Dz4phxMvx8srAG559P4wxR/Uok4FK+tAF8zGdP/5NOSfpO/A26dmLlAElPERxrkcV5S2
         WtHGQfwaJ2EqOZ84vGsMGDV9GVJWYVHDIZ0rO61Zj/AVt5jKlS32chfmoIjfOEsGqMmp
         RCtLtLUpYy/0R2iEoh3dIdSY5jUVyP3h19EsqxNGXJqes+yuwDoVBHidyU3LbXu56FES
         BG/aQtxcyGCIaM50xLAmhLTcZBVm+t1Y2F1bNVDzqhr8+6WYtw/UZ7fdqnO1dmPjY2tA
         8y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777824707; x=1778429507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzxOxsGcFm211D/OgKdeeQ+aVWqj1QWVrx9oBqAxphU=;
        b=Nsnb+nmaS5h4PX4nn103pBn6/cObevR2G4YQmuwHJ3D8P27qfxJS5JU/QlgRVxvImn
         i8jwfNVdDmGVArYd17Kk4JStYXdRjUNie0Ym4ACCJXhVijydcc5z3WYKqUwPzUcLSxm/
         fHtstihHGXsWhG+R0cjs0dwS/qSfNE5sbczITfrGxRtv7nHdo+u39QKZSJrTqAykl+S2
         crcmJTHwOVz0Xk0gJlLy8VjBYmvIZM9dKI74mh2RLcShHvjgZm3jmVwX3M93ytwIOqV0
         UJUyuRY2w88IG+9wJiICDEOAynZwwbvOCbGga2dwCnjyDP7hlFn6+OSY8Rums5AiEClE
         Kd6A==
X-Forwarded-Encrypted: i=1; AFNElJ9xyDdVusV6ONkpkw5SZ/hyh1uKBB6jCgz+bPnmDAPgvNFaCCMbORFe+JuK9AHQEt88UgBQKAHJME5stA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrWLXAqJjqdMCKcP5M9PK1f0ykj7Jrr0oT/DPbjWWqqguQgj0G
	0+Xwx6oAV3IJYmVUzym2FJCnPQnUboP+lF5ONrU9J1zirwri3b1RTDL+RJ9GkU6w96zEcK2A7OK
	HpD9fj1Z92kL2xvy8rYIB7IY+H8IDXfo=
X-Gm-Gg: AeBDievNlsiOX7C6sBsnqS6/aYmufZvkwoFVwCBeYAK1keUsYoXEWhK8OjC/+VqMnIJ
	x7QJx2Yr8Z3loVgEsaOEBPfkKUAvmaLtD0gzM9ph/Bukmd0FUSroSnh6dVKHohRH74ITarScHc/
	Y2IWNRygRI5i3kLK12nnEhR/Eshbh43CDJ7tqtZeKTnW6Uw6HGuWmdF4ezJ0/yDVLxbWhqHFR27
	VyQSgtcEd6cnwwknFlCAlzeZijFsLk/4pU52hWHT23m0h5JHL/rHO8wU/kmCDDfIkpFcLM1deLj
	8KvZuCfgOuAH+YjIszHOY/bS4vz0q3ONrx1tPPRnfxUtiw+EDwX2
X-Received: by 2002:a05:6820:2012:b0:696:1a85:586b with SMTP id
 006d021491bc7-69697c3388cmr3210846eaf.35.1777824707302; Sun, 03 May 2026
 09:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260502161802.515547-1-mohamedaymanworkspace@gmail.com> <928b68db-4cf4-454c-aa88-3104e689a642@kernel.org>
In-Reply-To: <928b68db-4cf4-454c-aa88-3104e689a642@kernel.org>
From: MOHAMED AYMAN <mohamedaymanworkspace@gmail.com>
Date: Sun, 3 May 2026 19:11:35 +0300
X-Gm-Features: AVHnY4K_RBMxgDSjJxtdHL7S_PthlvR5N9xLJOhSiri-_81qxZgDSZcTNYYJiTI
Message-ID: <CABWZVhoEjG-t8xxdhDec-oTW-9nHQE=zy3z1fMPMupJD=izOpA@mail.gmail.com>
Subject: Re: [PATCH] riscv: cpuinfo: Fix NULL dereference and inconsistent
 error code
To: Michael Ellerman <mpe@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_091149_534178_D7FF0640 
X-CRM114-Status: GOOD (  15.33  )
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

VGhhbmtzIGZvciB0aGUgcmV2aWV3IE1pY2hhZWwuCgpZb3UncmUgcmlnaHQsIGJvdGggb2ZfcHJv
cGVydHlfcmVhZF9zdHJpbmcoKSBhbmQgb2Zfbm9kZV9wdXQoKSBoYW5kbGUKTlVMTCBucCBpbnRl
cm5hbGx5LCBzbyB0aGUgY19zaG93KCkgaHVuayBpcyB1bm5lY2Vzc2FyeS4gSSdsbCBkcm9wIGl0
CmluIHYzLgoKSSdsbCBhbHNvIHNlbmQgdGhlIC1FTk9ERVYgZml4IGFzIGEgc3RhbmRhbG9uZSBw
YXRjaCBhcyB5b3Ugc3VnZ2VzdGVkLiA6KQoKT24gU3VuLCBNYXkgMywgMjAyNiBhdCAzOjI24oCv
UE0gTWljaGFlbCBFbGxlcm1hbiA8bXBlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMy81LzIw
MjYgMDI6MTcsIE1vaGFtZWQgQXltYW4gd3JvdGU6Cj4gPiBGaXggYSBwb3RlbnRpYWwgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGluIGNfc2hvdygpIGJ5IGVuc3VyaW5nCj4gPiB0aGUgZGV2aWNl
IHRyZWUgbm9kZSByZXR1cm5lZCBieSBvZl9nZXRfY3B1X25vZGUoKSBpcyBjaGVja2VkIGJlZm9y
ZSB1c2UuCj4KPiBXaGVyZSBpcyB0aGUgTlVMTCBwb2ludGVyIGRlcmVmPwo+Cj4gb2ZfcHJvcGVy
dHlfcmVhZF9zdHJpbmcoKSBjYW4gY29wZSB3aXRoIGEgTlVMTCBucCwgaXQganVzdCByZXR1cm5z
IGFuIGVycm9yLgo+Cj4gb2Zfbm9kZV9wdXQoKSBhbHNvIGhhbmRsZXMgYSBOVUxMIG5wLgo+Cj4g
PiBBbHNvIHJlcGxhY2UgYSBub24tc3RhbmRhcmQgcmV0dXJuIHZhbHVlICgtMSkgaW4KPiA+IHJp
c2N2X29mX3BhcmVudF9oYXJ0aWQoKSB3aXRoIC1FTk9ERVYgdG8gZm9sbG93IExpbnV4IGtlcm5l
bAo+ID4gY29udmVudGlvbnMgZm9yICJub3QgZm91bmQiIGVycm9yIHJldHVybnMuCj4KPiBUaGF0
IHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLiBJdCBkb2VzIGxvb2sgbGlrZSBhIGdvb2QgY2hh
bmdlLiBBdAo+IGxlYXN0IHNvbWUgb2YgdGhlIGNhbGxlcnMgb2YgcmlzY3Zfb2ZfcGFyZW50X2hh
cnRpZCgpIHBhc3MgdGhlIHJldHVybgo+IHZhbHVlIHVwIHRvIHRoZWlyIGNhbGxlcnMsIHNvIC0x
IGNvdWxkIGJlIG1pc2ludGVycHJldGVkIHNvbWV3aGVyZSBhcyBFUEVSTS4KPgo+IGNoZWVycwo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
