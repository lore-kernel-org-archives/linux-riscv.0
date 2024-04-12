Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BECFC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 17:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWlxcqoIEgarM/PbsTykqlAHOdxqPh0pAYg3NF6Z8lI=; b=2fIHI2inJ6wd/3
	t9RzS/3VTDFcwc2ABMLJNY064aQBFvwWi0nTIXzZEEZMEcP2qrq90mVXkR6R8j8UODfWtq5nuuqZG
	l3oeezizbcRE8+qX8hclGHEK6/5LIW8eNlYohMcip4wyU53KFD0hn6hNF5vK6Dgs1KlHFvKiEBrQA
	4Oj8l5SYIdgeaHoiHb9NIw4RuLvnmUwlaTUrzlQcNd5lidOTVBtEhxJWDRdzpYB7vTKqFNEnRMteo
	WIkyQ/rGaF2lufaOMsRZkpJtL6OzYZhISayPn52+Ae61SSli88aUNwhVH4hGiMfcppMWXdr+Kg83+
	/KJCWq3YyJuheU42lPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKKi-00000000ajr-3xQe;
	Fri, 12 Apr 2024 17:05:00 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvKKf-00000000ahr-3QQn
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 17:04:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d88a869ce6so12848891fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 10:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712941493; x=1713546293; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYOCD7qA19/JAXwkJAfYs6ERNWjQ6TGuUnce7Ev3h1g=;
        b=uLxisJROk2ixkrETfoYDkf/Dr0kNPw6Rwb1dc0zgf+33eu5htIgr0YXj44Js8GTo3b
         snFtSN1G16lYVQmJpVe0HJnCUVSMqVEaFcJw3eNIEopuL2ljzJhgpuWrPgWg5c2lo1mk
         FPG/460HvVhHcxjRiukjZuFNMgH+AMinVTtZJu7Xwje5ApyZKHdx7yXOwtixzcok37lS
         kw37MmLLXiuv/L7UXi8pytOjfaL/y8VMFrYdHmO3J0N81HeuBUkC/jFQot5EHp1veh8C
         TTtBLDTEeDfsqubzqv3yb3Uz4DWqyKnpB0THHbj9VWlWb0bf5Z80TPBOPFIC2ojr56zQ
         mwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712941493; x=1713546293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYOCD7qA19/JAXwkJAfYs6ERNWjQ6TGuUnce7Ev3h1g=;
        b=ljCks2xKg3Q8KlwCKIMY7ViFUcH74ecG+j/m4e4RLOakb7BUosuOaJlt1UtvFNCAyC
         FV696eKWScl5lpwL00MutKfVQveC3GyBUqb26xHrd8bDunJgIV7st9KQwY9Vi1LiKhvM
         1JkUKkvEkNDz5pWZV2w3N9WEcz9KH+kbco7rAx68PqgaV8Q+5SiRLKrAg+E4P9MwEGe3
         xTFHOs5/jEcYy+QfK7exkbMwWcYrZhIAtxdpiGO8KVwhX1pm+zxJA+TQ3AKvUoJF7Hfc
         fZGsHTtjsP2PoSYFPRzDDYybpzqBMVRYvJ6r7+lSeHoVrht8vK0HQXtEnU42P0gPtlb/
         uxUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWllR4HNs4T84/iVTgj81uYMQsWM8ytzVYRmcZpf065E1p7sRvChu5UsZYgpnYvB6ghiB1EIXfRD/8XMpXDyKBmoUiLbl3FqmKHH8IFIdcl
X-Gm-Message-State: AOJu0YwQFxl+O+jedSReQxtJzSdLkCYOV4Z5Umu+EQt2UF0Eu/d0duPP
	g9DklazmWBoq9/wxtcT3wk6RDPpJyw8xXQN+TrmyU+8Ntfx0t5ymVbrpxvt8RJLfMYa7c6sJ4jn
	XMUkSFG6oFKkWh0uvSqnGoixdFjbrN86DYxsjng==
X-Google-Smtp-Source: AGHT+IEVhmpSPd185VDGAisXX5CbjlYY2cqdA2jBznkqi4gMJsx6SWiduJXurWu4KxUaLTi372RCaB93r5g8yMqVxEs=
X-Received: by 2002:a2e:95cc:0:b0:2da:7af:e6a0 with SMTP id
 y12-20020a2e95cc000000b002da07afe6a0mr2360061ljh.38.1712941493181; Fri, 12
 Apr 2024 10:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-2-4af9815ec746@rivosinc.com>
 <20240412-tuesday-resident-d9d07e75463c@wendy>
In-Reply-To: <20240412-tuesday-resident-d9d07e75463c@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 12 Apr 2024 10:04:17 -0700
Message-ID: <CALs-HsuMZOMpDh8kwQx6FE2mawzt+qTD-WZ6Mvhrt+hUhkZimg@mail.gmail.com>
Subject: Re: [PATCH 02/19] riscv: cpufeature: Fix thead vector hwcap removal
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_100457_865503_39A2BADE 
X-CRM114-Status: GOOD (  24.37  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMzoyNuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBcHIgMTEsIDIwMjQgYXQgMDk6
MTE6MDhQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gVGhlIHJpc2N2X2NwdWlu
Zm8gc3RydWN0IHRoYXQgY29udGFpbnMgbXZlbmRvcmlkIGFuZCBtYXJjaGlkIGlzIG5vdAo+ID4g
cG9wdWxhdGVkIHVudGlsIGFsbCBoYXJ0cyBhcmUgYm9vdGVkIHdoaWNoIGhhcHBlbnMgYWZ0ZXIg
dGhlIERUIHBhcnNpbmcuCj4gPiBVc2UgdGhlIHZlbmRvcmlkL2FyY2hpZCB2YWx1ZXMgZnJvbSB0
aGUgRFQgaWYgYXZhaWxhYmxlIG9yIGFzc3VtZSBhbGwKPiA+IGhhcnRzIGhhdmUgdGhlIHNhbWUg
dmFsdWVzIGFzIHRoZSBib290IGhhcnQgYXMgYSBmYWxsYmFjay4KPiA+Cj4gPiBGaXhlczogZDgy
ZjMyMjAyZTBkICgiUklTQy1WOiBJZ25vcmUgViBmcm9tIHRoZSByaXNjdixpc2EgRFQgcHJvcGVy
dHkgb24gb2xkZXIgVC1IZWFkIENQVXMiKQo+Cj4gSWYgdGhpcyBpcyBvdXIgb25seSB1c2UgY2Fz
ZSBmb3IgZ2V0dGluZyB0aGUgbXZlbmRvcmlkL21hcmNoaWQgc3R1ZmYKPiBmcm9tIGR0LCB0aGVu
IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFkZCBpdC4gTm9uZSBvZiB0aGUgZGV2aWNldHJlZXMK
PiB0aGF0IHRoZSBjb21taXQgeW91J3JlIGZpeGluZyBoZXJlIGFkZHJlc3NlcyB3aWxsIGhhdmUg
dGhlc2UgcHJvcGVydGllcwo+IGFuZCBpZiB0aGV5IGRpZCBoYXZlIHRoZW0sIHRoZXknZCB0aGVu
IGFsc28gYmUgbmV3IGVub3VnaCB0byBob3BlZnVsbHkKPiBub3QgaGF2ZSAidiIgZWl0aGVyIC0g
dGhlIGlzc3VlIGlzIHRoZXkncmUgdXNpbmcgd2hhdGV2ZXIgY3JhcCB0aGUKPiB2ZW5kb3Igc2hp
cHBlZC4KPiBJZiB3ZSdyZSBnb25uYSBnZXQgdGhlIGluZm9ybWF0aW9uIGZyb20gRFQsIHdlIGFs
cmVhZHkgaGF2ZSBzb21ldGhpbmcKPiB0aGF0IHdlIGNhbiBsb29rIGF0IHRvIHBlcmZvcm0gdGhl
IGRpc2FibGUgYXMgdGhlIGNwdSBjb21wYXRpYmxlcyBnaXZlCj4gdXMgZW5vdWdoIGluZm9ybWF0
aW9uIHRvIG1ha2UgdGhlIGRlY2lzaW9uLgo+Cj4gSSBhbHNvIHRoaW5rIHRoYXQgd2UgY291bGQg
anVzdCBjYWNoZSB0aGUgYm9vdCBDUFUncyBtYXJjaGlkL212ZW5kb3JpZCwKPiBzaW5jZSB3ZSBh
bHJlYWR5IGhhdmUgdG8gbG9vayBhdCBpdCBpbiByaXNjdl9maWxsX2NwdV9tZnJfaW5mbygpLCBh
dm9pZAo+IHJlcGVhdGluZyB0aGVzZSBlY2FsbHMgb24gYWxsIHN5c3RlbXMuCj4KPiBQZXJoYXBz
IGZvciBub3cgd2UgY291bGQganVzdCBsb29rIGF0IHRoZSBib290IENQVSBhbG9uZT8gVG8gbXkK
PiBrbm93bGVkZ2UgdGhlIHN5c3RlbXMgdGhhdCB0aGlzIHRhcmdldHMgYWxsIGhhdmUgaG9tb2dl
bmVvdXMKPiBtYXJjaGlkL212ZW5kb3JpZCB2YWx1ZXMgb2YgMHgwLgoKSXQncyBwb3NzaWJsZSBJ
J20gbWlzaW50ZXJwcmV0aW5nLCBidXQgaXMgdGhlIHN1Z2dlc3Rpb24gdG8gYXBwbHkgdGhlCm1h
cmNoaWQvbXZlbmRvcmlkIHdlIGZpbmQgb24gdGhlIGJvb3QgQ1BVIGFuZCBhc3N1bWUgaXQncyB0
aGUgc2FtZSBvbgphbGwgb3RoZXIgQ1BVcz8gU2luY2Ugd2UncmUgcmVwb3J0aW5nIHRoZSBtYXJj
aGlkL212ZW5kb3JpZC9taW1waWQgdG8KdXNlcm1vZGUgaW4gYSBwZXItaGFydCB3YXksIGl0IHdv
dWxkIGJlIGJldHRlciBJTU8gaWYgd2UgcmVhbGx5IGRvCnF1ZXJ5IG1hcmNoaWQvbXZlbmRvcmlk
L21pbXBpZCBvbiBlYWNoIGhhcnQuIFRoZSBwcm9ibGVtIHdpdGggYXBwbHlpbmcKdGhlIGJvb3Qg
Q1BVJ3MgdmFsdWUgZXZlcnl3aGVyZSBpcyBpZiB3ZSdyZSBldmVyIHdyb25nIGluIHRoZSBmdXR1
cmUKKGllIHRoYXQgYXNzdW1wdGlvbiBkb2Vzbid0IGhvbGQgb24gc29tZSBtYWNoaW5lKSwgd2Un
bGwgb25seSBmaW5kIG91dAphYm91dCBpdCBhZnRlciB0aGUgZmFjdC4gU2luY2Ugd2UgcmVwb3J0
ZWQgdGhlIHdyb25nIGluZm9ybWF0aW9uIHRvCnVzZXJtb2RlIHZpYSBod3Byb2JlLCBpdCdsbCBi
ZSBhbiB1Z2x5IHVzZXJzcGFjZSBBQkkgaXNzdWUgdG8gY2xlYW4KdXAuCgotRXZhbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
