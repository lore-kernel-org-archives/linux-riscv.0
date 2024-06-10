Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4D9C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHT7kN3nQprlXP7+KKf76ybdCyK+URMVjpNrccYJkx0=; b=ipsCkErFLZaPrC
	BrGdkxjgll6k8kusux/ACHZnuKnJZgXcMgv7DWMkCg7h77Kde9ov+yh4XFsyuX4/53eIojJtEWIHV
	pzIxayKh+TPalESf0WtbuTlsCk8HzFteRZObmKF1NNncmTogjr6hszUO02kImjbw0z997oG5mfMPc
	3WoqGfuDd69fl3eGzz4IdWv5C8i0XWnvQmQOA7ztC28DSSa32EvLEEh8s7sqZMnU2j1+lwaEvf6Fy
	fwzPVLdCditwrd5WbM8swDZsWmpLrchE4Glyg44ubeNHhnwW/6gXPG18Gn9AN45eUXCkuevQlRASp
	51g4yP4yOAjMfrHvtdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGb8z-00000004QPm-1Dzn;
	Mon, 10 Jun 2024 09:16:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGb8w-00000004QOy-0gUS
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 09:16:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4217e89b470so1542295e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718011004; x=1718615804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lrielQGYIMguUfiUX6UfwLtR5TJhNk4+xdvkzMalag=;
        b=Ba/sfWE/Fj+fuhGl17fjIjUrbJyGa4xAQXaWe8DMU1ExIMRcRUD+8dD0eevrIWB8dD
         nA1AhxLz+QfFXF6t5O0RtkFQHzh2St/AoAgM9BY4xiYsFFSVaSAGf+y2w5LcOJ8qspm+
         G+VSR+LrXBhFXAdnhoZ1qFxtFYLTA5NP2UYBRbrB1Rqi+Y4SDrg454FvpVY9g4eXl33f
         ihnl4wnfRKkXAytn0A5AOnN/XgXxvCNOUNDQl5KW/VgbrqlIcG80EpAjxi8I1bhFjCXr
         RvOds8W5Oou+7MWqixnykj/Xbw8ZkuXLCrGaKHs+0cD6DzaqYewdpmX9+3a/5pbb0Ah2
         2wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011004; x=1718615804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lrielQGYIMguUfiUX6UfwLtR5TJhNk4+xdvkzMalag=;
        b=FIWFJDfCc7W6+9QuhLgYnqOiMFNYs7q2OG8dSBCiPaBWBhn3GcOKBfq5w6pLAoLoNV
         W34vIeQQk18S0+u9eHAIesRHi7PtgJybI+B4P6aAx7cx49EKrPEzUyUZHQHv8/Nm1coC
         P2GQz9GmG/z11qS2Npe/lUQIuF+qh0OOMkyDQ1R+QOfldji2ZtjUfyUkAkHzDTfr7fvs
         wk0tdQT1TWjAqG/AxXvZ7ncXaSrc86K0TCzYO/JEnmUNTdobtwcT1KAq7857Rn5caWw+
         Q6vRHWam9f8sZ4KixQtpJvTbH2kstytb6L57bCBb24MnZhz+ZTRfG2n4q4/H143ZFLRH
         O91Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWlPHDnagjFaBF6N89t6DvK1EFRXDU+Q6m77T9+sk82kKk5iLHvGLUlefZcYyTU+phfL2jpbrRtH3J9ZtcM1kHUrA8J63NT6gL3PVSTl1k
X-Gm-Message-State: AOJu0YzRqhBt8Evq/ApXnf3LyHRi/JvbaIa0PoIkfSUvbaq78M7QsoPZ
	s7TkH8uxAzVm8xg3ICrxcbda6qyv8kbC0Ma5BtWk15xQ1l52RFDOUubFtb7L8QQ=
X-Google-Smtp-Source: AGHT+IHOEGwCc48/FhlHvQJiZSBZyz2Sx26g7eIgkgXL5GnyBIbBYEgnIb2Y1H9ad2f8qgYy/NlUTw==
X-Received: by 2002:a05:600c:4705:b0:421:2c02:9779 with SMTP id 5b1f17b1804b1-42164a51ef1mr68372565e9.4.1718011003803;
        Mon, 10 Jun 2024 02:16:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:deb:d879:7179:d010? ([2a01:e0a:999:a3a0:deb:d879:7179:d010])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1e92dde6sm3857924f8f.41.2024.06.10.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 02:16:42 -0700 (PDT)
Message-ID: <01547275-8c8c-43cf-9da0-64825c234707@rivosinc.com>
Date: Mon, 10 Jun 2024 11:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Deepak Gupta <debug@rivosinc.com>, Conor Dooley <conor@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <jesse@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atishp@rivosinc.com>
References: <20240531162327.2436962-1-jesse@rivosinc.com>
 <20240531-uselessly-spied-262ecf44e694@spud>
 <b199fde6-c24e-4c18-9c38-fdc923294551@ghiti.fr>
 <20240603-stinking-roster-cfad46696ae5@spud>
 <ZmNWmxak9Rc80Kpb@debug.ba.rivosinc.com>
 <c288f739-2a1a-4fd7-884b-12e360a33142@rivosinc.com>
 <20240610-qualm-chalice-72d0cc743658@wendy>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240610-qualm-chalice-72d0cc743658@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_021646_226922_DDC912B3 
X-CRM114-Status: GOOD (  21.79  )
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

CgpPbiAxMC8wNi8yMDI0IDExOjAyLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBKdW4g
MTAsIDIwMjQgYXQgMTA6MzM6MzRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAwNy8wNi8yMDI0IDIwOjUxLCBEZWVwYWsgR3VwdGEgd3JvdGU6Cj4+PiBPbiBNb24s
IEp1biAwMywgMjAyNCBhdCAwMTo0Nzo0MFBNICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+
Pj4gT24gTW9uLCBKdW4gMDMsIDIwMjQgYXQgMTE6MTQ6NDlBTSArMDIwMCwgQWxleGFuZHJlIEdo
aXRpIHdyb3RlOgo+Pj4+PiBIaSBDb25vciwKPj4+Pj4KPj4+Pj4gT24gMzEvMDUvMjAyNCAxOToz
MSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+Pj4+Pj4gT24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTI6
MjM6MjdQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3JvdGU6Cj4+Pj4+Pj4gRGVjdGVjdCB0aGUgWmty
IGV4dGVuc2lvbiBhbmQgdXNlIGl0IHRvIHNlZWQgdGhlIGtlcm5lbCBiYXNlCj4+Pj4+IGFkZHJl
c3MuCj4+Pj4+Pj4KPj4+Pj4+PiBEZXRlY3Rpb24gb2YgdGhlIGV4dGVuc2lvbiBjYW4gbm90IGJl
IGRvbmUgaW4gdGhlIHR5cGljYWwKPj4+Pj4gZmFzaGlvbiwgYXMKPj4+Pj4+PiB0aGlzIGlzIHZl
cnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcy4gSW5zdGVhZCwgYWRkIGEgdHJhcCBoYW5kbGVy
Cj4+Pj4+Pj4gYW5kIHJ1biBpdCB0byBzZWUgaWYgdGhlIGV4dGVuc2lvbiBpcyBwcmVzZW50Lgo+
Pj4+Pj4gWW91IGNhbid0IHJlbHkgb24gdGhlIGxhY2sgb2YgYSB0cmFwIG1lYW5pbmcgdGhhdCBa
a3IgaXMgcHJlc2VudAo+Pj4+PiB1bmxlc3MKPj4+Pj4+IHlvdSBrbm93IHRoYXQgdGhlIHBsYXRm
b3JtIGltcGxlbWVudHMgU3NzdHJpY3QuIFRoZSBDU1Igd2l0aCB0aGF0Cj4+Pj4+IG51bWJlcgo+
Pj4+Pj4gY291bGQgZG8gYW55dGhpbmcgaWYgbm90IFNzc3RyaWN0IGNvbXBsaWFudCwgc28gdGhp
cyBhcHByb2FjaCBnZXRzIGEKPj4+Pj4+IG5hayBmcm9tIG1lLiBVbmZvcnR1bmF0ZWx5LCBTc3N0
cmljdCBkb2Vzbid0IHByb3ZpZGUgYSB3YXkgdG8gZGV0ZWN0Cj4+Pj4+PiBpdCwgc28geW91J3Jl
IHN0dWNrIHdpdGggZ2V0dGluZyB0aGF0IGluZm9ybWF0aW9uIGZyb20gZmlybXdhcmUuCj4+Pj4+
Cj4+Pj4+Cj4+Pj4+IEZZSSwgdGhpcyBwYXRjaCBpcyBteSBpZGVhLCBzbyBJJ20gdGhlIG9uZSB0
byBibGFtZSBoZXJlIDopCj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gRm9yIERUIHN5c3RlbXMs
IHlvdSBjYW4gYWN0dWFsbHkgcGFyc2UgdGhlIERUIGluIHRoZSBwaSwgd2UgZG8gaXQKPj4+Pj4g
dG8gZ2V0Cj4+Pj4+PiB0aGUga2FzbHIgc2VlZCBpZiBwcmVzZW50LCBzbyB5b3UgY2FuIGFjdHVh
bGx5IGNoZWNrIGZvciBaa3IuIFdpdGgKPj4+Pj4gQUNQSQo+Pj4+Pj4gSSBoYXZlIG5vIGlkZWEg
aG93IHlvdSBjYW4gZ2V0IHRoYXQgaW5mb3JtYXRpb24sIEkgYW1uJ3QgYW4gQUNQSS1pc3QuCj4+
Pj4+Cj4+Pj4+Cj4+Pj4+IEkgdG9vayBhIGxvb2sgYXQgaG93IHRvIGFjY2VzcyBBQ1BJIHRhYmxl
cyB0aGlzIGVhcmx5IHdoZW4KPj4+Pj4gaW1wbGVtZW50aW5nIHRoZQo+Pj4+PiBaYWJoYS9aYWNh
cyBwYXRjaGVzLCBidXQgaXQgc2VlbXMgbm90IHBvc3NpYmxlLgo+Pj4+Pgo+Pj4+PiBCdXQgSSds
bCBsb29rIGludG8gdGhpcyBtb3JlLCB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgdGltZSB3ZSBuZWVk
IHRoZQo+Pj4+PiBleHRlbnNpb25zIGxpc3QgdmVyeSBlYXJseSBhbmQgc2luY2Ugd2UgaGF2ZSBu
byB3YXkgdG8gZGV0ZWN0IHRoZQo+Pj4+PiBwcmVzZW5jZQo+Pj4+PiBvZiBhbiBleHRlbnNpb24g
YXQgcnVudGltZSwgc29tZXRoaW5nIG5lZWRzIHRvIGJlIGRvbmUuCj4+Pj4KPj4+PiBBeWUsIGhh
dmluZyByZW1lbWJlcmVkIHRoYXQgcmVhZGluZyBDU1JfU0VFRCBjb3VsZCBoYXZlIHNpZGUtZWZm
ZWN0cyBvbiBhCj4+Pj4gc3lzdGVtIHdpdGggbm9uLWNvbmZvcm1pbmcgZXh0ZW5zaW9ucywgaXQn
ZCBiZSBnb29kIHRvIHNlZSBpZiB3ZSBjYW4KPj4+PiBhY3R1YWxseSBkbyB0aGlzIHZpYSBkZXRl
Y3Rpb24gb24gQUNQSSAtIGVzcGVjaWFsbHkgZm9yIHNvbWUgb3RoZXIKPj4+PiBleHRlbnNpb25z
IHRoYXQgd2UgbWF5IG5lZWQgdG8gdHVybiBvbiB2ZXJ5IGVhcmx5IChJIGZvcmdldCB3aGljaCBv
bmVzIHdlCj4+Pj4gdGFsa2VkIGFib3V0IHRoaXMgYmVmb3JlIGZvcikuIEkgZGlkbid0IGFybTY0
IGRvIGFueXRoaW5nIHdpdGggQUNQSSBpbgo+Pj4+IHRoZQo+Pj4+IHBpIGNvZGUsIGlzIHRoZSBj
b2RlIGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZCBydW4gYXQgYW4gZXF1aXZpbGVudC1pc2gKPj4+
PiBwb2ludAo+Pj4+IGluIGJvb3Q/Cj4+Pgo+Pj4gY2M6ICtDbGVtZW50IGFuZCBBdGlzaAo+Pj4K
Pj4+IEkgZG9uJ3Qga25vdyBhbGwgdGhlIGRldGFpbHMgYnV0IG9uIGZpcnN0IGdsYW5jZSBpdCBz
ZWVtcyBsaWtlIGluc3RlYWQKPj4+IG9mIEFDUEksCj4+PiBtYXkgYmUgRldGVCBpcyBhIGJldHRl
ciBwbGFjZSBmb3IgZGlzY292ZXJ5ID8KPj4+IGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVj
aC1wcnMvdG9waWMvcGF0Y2hfdjEyX2FkZF9maXJtd2FyZS8xMDY0Nzk1NzEKPj4KPj4gSU1ITywg
ZG9pbmcgZGlzY292ZXJ5IGluIEZXRlQgaXMgbm90IHRoZSBnb2FsIG9mIHRoaXMgZXh0ZW5zaW9u
LiBJIHRoaW5rCj4+IHRoZSAicmVhbCIgc29sdXRpb24gd291bGQgYmUgdG8gd2FpdCBmb3IgdGhl
IHVuaWZpZWQgZGlzY292ZXJ5IHRhc2sKPj4gZ3JvdXAgdG8gY29tZSB1cCB3aXRoIHNvbWV0aGlu
ZyBmb3IgdGhhdCAod2hpY2ggaXMgdGhlaXIgZ29hbCBJIHRoaW5rKSBbMV0KPiAKPiBJJ20gY3Vy
aW91cyB0byBzZWUgaG93IHRoYXQgd29ya3Mgb3V0LiBUaGUgcHJvcG9zYWwgZG9jdW1lbnRzIGFu
IG0tbW9kZQo+IGNzciwgc28gd2UnZCBoYXZlIHRvIHNtdWdnbGUgdGhlIGluZm9ybWF0aW9uIHRv
IHMtbW9kZSBzb21laG93Li4uCgpBaGVtLCB5ZWFoLCBJIHNwb2tlIGEgYml0IHRvbyBmYXN0LiBM
b29rZWQgYXQgdGhlIHByb3Bvc2FsIGFuZCB0aGUKbWNvbmZpZ3B0ciBDU1Igd2lsbCBiZSBhY2Nl
c3NpYmxlIGJ5IE0tbW9kZSBvbmx5IHNvIEkgZ3Vlc3Mgd2Ugd2lsbCBoYXZlCnRvIGZpbmQgYW5v
dGhlciB3YXkuLi4KCj4gCj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9jb25maWd1
cmF0aW9uLXN0cnVjdHVyZSBbMV0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
