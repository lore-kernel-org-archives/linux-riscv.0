Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5985BC55182
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 03:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7qF15JW9DE0isRrt7J+E9bQaQW1t8ku0SVlL5yjBXI=; b=Ule3FZINaAkG+P
	ohD4gKmRVONw6i6Lx+xCLVQjZ7nUO1UB8zrOMGsp4e/YtJaIPhWd29maZDsUzI9qCecmlQgvzP41d
	hpz1tzC4BABEXNy0D050Cpck30ewS5yeBnGUfCdzW9H+r3w65RzZkqQo4DL/mbnwpc8bX++Ms4dnB
	lvnO889hyDUYmjUkeLUbUITk7YgdwqOpjJtI2qvQUl6OK6bjBe3He6JHRCE4M9JxFcfqI+2NSSr57
	TiHAFEu1Gxbc4DiH8jpuO8D7LSvF9kYjKpcxl7fDEqjZEDFp0o9nljrHdOwJW8HRv4awzItX+Q7fb
	CWDIQudAkrQUbWSH0brQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSUo-00000003BGj-2o2H;
	Wed, 05 Aug 2026 03:40:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSUm-00000003BGA-0aOd
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 03:40:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38dcbade417so405849a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 20:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785901243; x=1786506043; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=ONnzpaZO097VxArdhrUXmxHJCIWhokJWyuZa62FfFeRJxXiVQfbRYgnRwwe2R//0Cg
         UIWj4y75FH+EuzMs9SxjMpnmYEyuPPfyjimS+1Gwxf0ae+5HZG7zQjDNmQDV3JoQj0gM
         zRMulpxQNoKBmnTeoBkc0LKHKAQ3x73XiJSGlJuv02vOnvy8tc5BbTmj8VS7YgVQRiod
         YjZpHI1wYaZqnK39ncdDG7aLVKSkPuard6JHFKOMBHyVJbjNnAZ4+R+Da3sdKkWAN/e5
         PNiz6qv28v620iz0Ki3x7rvK0G3rfhgaD75Ei1dA0OTN1wBNEqigZZXRv8Owlg+NrGHY
         uoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901243; x=1786506043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b3uhTNsEfEA4V2HM2KbClDOzdBojungNZKQ+/eKrllo=;
        b=E/04J3GUfeYv7QJi+SDhrIJ6wVPNvQHX+lIIus8U6YBmGuMK+voJf9jl1S503NnL6m
         6NXZcmW5qKNIrIEdkBsWYDuSeaWktMAcK2HXrFm48UhAJee+EzZHHbpxmXSvQWRqT5pd
         ZLZOZyWVy9uaUafNdfD7YjUFkV8WgEG1k+9zgAn4clHjLNreyNcQZgmlZlBGII8PEGwa
         zzb2eSbXBMuEfg65B5DxNyHhxEkVrDASNael2V8xxuGd/TwrE1dxboi8Ncd9jvC3oZhA
         K1gZoVaWCEuQlH0IbTwaT5XRerT07eVXv3GhnY7EH142NayNL+mcoYXjzFadiELbWQcP
         L3mg==
X-Forwarded-Encrypted: i=1; AHgh+Rp97Tuv07J9wmFvYTQQnkL6jBnVUDBdB8ULwMpB5SGujVJE6qwtozyxuwTinx3fVpj329F0muT01dkdDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEN1xdvz4lnEHITpGlap7kHc+NRDt83eCwS3NZS6ou2znNDTPv
	01++StnGm+JPXGteom7QdAN1GfSHd2FUVZMSR6YmBB6JRwE/2kYep4N5
X-Gm-Gg: AR+sD10VZSpjlvGsNrPWWRjH8RDom/RejOuyvMce6IRu4ZiYPN8On5pZf5jt7hei/fL
	Zt0pk+3inJ1DFOilONdMy1F3sJ0BdMxQfskVi8wleLqT47nEh+1KQDTqM7XQLgr1yaWfWANkiCL
	seYXnuqVmth7vTlAn7uL6+BLMNOS2DQRQd/qoAaHCjBSmBU1kWsXvtSCKUdKmaEb9qZQRZwyxdt
	1MNxz98sZuO/86wj16FPULI9cv+LT3aJmeXTpgqrcpSymNgaxxYQNltqrL9scQVpU4zUYMxY+5j
	evl884LZQonwR72+p2A2Wrf3ZHXf19W6gwLm6P6DrkL2w/EEdi8l9po1TBBwAOzOdDqrtUYPJg6
	5NtvyAVkYjQYm5HEMtvrLb8ZksJL1sEx7n0a1v3Oy3lemON7X8o15iovH9obEeLWnOCoRWvD53h
	29Vrme3reJlnBkNcD62/MARtsu/Z47SOp7Ax0lw2iBbH2QfVnTjb5e5mVAEg==
X-Received: by 2002:a17:90b:1811:b0:38e:c7b0:84ad with SMTP id 98e67ed59e1d1-3903bb0ab77mr3022104a91.0.1785901242802;
        Tue, 04 Aug 2026 20:40:42 -0700 (PDT)
Received: from x1 ([184.3.251.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903917a5d0sm1534085a91.6.2026.08.04.20.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 20:40:41 -0700 (PDT)
Date: Tue, 4 Aug 2026 20:40:39 -0700
From: Drew Fustini <pdp7pdp7@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
	Borislav Petkov <bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gong Shuai <gong.shuai@sanechips.com.cn>,
	Gong Shuai <gsh517@gmail.com>, guo.wenjia23@zte.com.cn,
	James Morse <james.morse@arm.com>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Newman <peternewman@google.com>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>,
	yunhui cui <cuiyunhui@bytedance.com>,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, devicetree@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/8] riscv: Detect the Ssqosid extension
Message-ID: <anKwt4llzgwySljb@x1>
References: <20260729-dfustini-atl-sc-cbqri-dt-v6-0-7c22b05d461b@kernel.org>
 <20260729-dfustini-atl-sc-cbqri-dt-v6-2-7c22b05d461b@kernel.org>
 <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c38f0bfa-54fc-d141-c166-7355901d8ad1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_204044_179692_D1A1EBDA 
X-CRM114-Status: GOOD (  11.59  )
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

T24gVHVlLCBBdWcgMDQsIDIwMjYgYXQgMDg6NDc6MDRQTSAtMDYwMCwgUGF1bCBXYWxtc2xleSB3
cm90ZToKPiBPbiBXZWQsIDI5IEp1bCAyMDI2LCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gCj4gPiBT
c3Fvc2lkIGlzIHRoZSBSSVNDLVYgUXVhbGl0eS1vZi1TZXJ2aWNlIChRb1MpIElkZW50aWZpZXJz
IHNwZWNpZmljYXRpb24KPiA+IHdoaWNoIGRlZmluZXMgdGhlIFN1cGVydmlzb3IgUmVzb3VyY2Ug
TWFuYWdlbWVudCBDb25maWd1cmF0aW9uIChzcm1jZmcpCj4gPiByZWdpc3Rlci4KPiA+IAo+ID4g
TGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXNzcW9zaWQvcmVsZWFzZXMvdGFn
L3YxLjAKPiA+IENvLWRldmVsb3BlZC1ieTogS29ybmVsIER1bMSZYmEgPG1pbmRhbEBzZW1paGFs
Zi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLb3JuZWwgRHVsxJliYSA8bWluZGFsQHNlbWloYWxm
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3Jn
Pgo+IAo+IFRoYW5rcywgcXVldWVkIGZvciB2Ny4zLgo+IAo+IAo+IC0gUGF1bAoKVGhhbmsgeW91
IGZvciBxdWV1aW5nIHBhdGNoIDEgYW5kIDIuIENhbiBQYXRjaCAzIGFsc28gYmUgY29uc2lkZXJl
ZCB0bwptYWtlIHRoZSBTc3Fvc2lkIENTUiBoYW5kbGluZyBjb21wbGV0ZSBmb3IgdGhpcyBtZXJn
ZSB3aW5kb3c/CgotRHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
