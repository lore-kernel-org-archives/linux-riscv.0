Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442EAD78786
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 14:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6h7x2N/tN3pANTnyigEZNkGdkFTclaC2WACGQi9nXag=; b=V55q53rl3piis6
	cMYw+T8Zne09HLF5xdMy/AgmZpsptbAXijSLi2hV6FTuEmDHUbSSbRxk9edg3wUjZWQIKmuBROoQP
	cYJVzUqMcL3K/ahOYf5m8fxws4ldZHO5wiN20w+KZOycZ74MGAJty80dsPYofsEg0XJKufGXTomas
	aF9JViQAa8m/O7CZ/rVM0Me3Ia+twWUeWFJkl5wib7obMAQsivdN6wsOjJQ4gXLq3+0zQT2e+yWIn
	qkb2R771jLbYfA6K1xSfQRUv23j1dZ0Vm+k6jzvT+6/73mDiaSC4gxYKRNFVO10jUIkSqXSuNl429
	Zw2Y9zMdkzs/pQHJYCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbax-0000000AQNX-3PMI;
	Fri, 19 Dec 2025 14:36:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbat-0000000AQHa-10RJ
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 14:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766154992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=HSFPB/bwkL8yxZYc5klNfsL7dvjnOX38Gvv8GtWH4y8=;
	b=REtFunrwBfMpCNjUzlTFJblKohJgO6SgqxHvx525+W5iMOAK9rCfT/ZKjpUpp3IZtM0cm8
	oL3uoBGph4u0mdlK43d33s4ssVvt9e7hfHpBtuUztdS9j8XEHaiwtGCxDg2f5Ec3RbhVSU
	D6kaYwbcZ+xLzngWV0dPeIyITYNIopg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-F5FIYTf0MHiAj4DxBJAPcA-1; Fri, 19 Dec 2025 09:36:30 -0500
X-MC-Unique: F5FIYTf0MHiAj4DxBJAPcA-1
X-Mimecast-MFC-AGG-ID: F5FIYTf0MHiAj4DxBJAPcA_1766154990
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a13be531b2so37281945ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 06:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766154990; x=1766759790;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HSFPB/bwkL8yxZYc5klNfsL7dvjnOX38Gvv8GtWH4y8=;
        b=gn4ilGLmpIj8yMO8ovVnvbY5drR9gzdLaPqLjkntAixoh9DmkLopbAroI/9hnWfZIG
         1ACD8cdavyA/5ABarntTsoCWCt+/1DQx30ix7DR2sUFpD/dcWlp9JwlWOXKSNgY5K0BF
         K+GKYi4viEHu7uygihPS/huBTmUTiZxVUtB5XKB5oxTv1RcJfKRaJcoaoRmS05OYYZof
         oEKhfI47ZsFkm2KQ/NUYkQmK8YdwudHqPgNEZpWinT7pXoj20PufVTUCGBHL+1tzdJ2q
         e5s1RHXh7jUvBrSzXPnSBvI8xBFeNA/gBMFO24cSUcy8s1/aAorJNNoQnUacEq4pE2WY
         Sdbg==
X-Gm-Message-State: AOJu0Yw4AoacIvbgaRIP9+EnnyD62EXn3lOT1TJE6cK/ufUWDcZclHBB
	/y14jpMGA74KPwO2JJR85A7DQ2TntuYFBFL9UZgS1Gmr0xy3O87nH0NYWu4fVp1wFNyikqBcFi0
	ZetsSLMet56OSki7EwkNavDRV6Z2w8+O8OPiZSY1meanpjAUK6+Ln3Y5Me6f9iY8y8IbASvRjnI
	nOIKghpPT1MOR63nhk/02D7Y94UQk0xSnMIhtx4vNeHXSI
X-Gm-Gg: AY/fxX6ElWBDKNXAPQV+qSoZ5a2ZFdHY9UN5gfHPLt57V8BLwl9//QF0mnDUKwFZmpo
	PFPGguOOFSWfNRU8hkA6xIDzkUd+3VTLBzYwJuZ7z+sUbHpZM3l5Az3dhKXQUypoy/8+p9wZG64
	gz4bLUO+pdwyE1WaYgsDsF4Y2MVNd5g4XTxj/4si3hMKb9UAeZvHzxXv92JHDu1A8bHLx9OH2Ni
	e5Y48k=
X-Received: by 2002:a17:90a:e7c9:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-34e92113546mr2602517a91.1.1766154989657;
        Fri, 19 Dec 2025 06:36:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6XTI+e9miphOZJZOd+oGctJdHIYB919X0q9PI20jDC/DqiFfT4PXKX2g1KDxLKh2+5CLUbQqa1wiKc1MyUkg=
X-Received: by 2002:a17:90a:e7c9:b0:34a:b8e0:dd64 with SMTP id
 98e67ed59e1d1-34e92113546mr2602507a91.1.1766154989236; Fri, 19 Dec 2025
 06:36:29 -0800 (PST)
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Fri, 19 Dec 2025 09:36:17 -0500
X-Gm-Features: AQt7F2pnE7QJEunHyj172HIMr_CoX0S3PPbHC3g7BOuigEeA0QrCgTUwLvZmr1E
Message-ID: <CAJD_bPKbZaEHmKzVcLPGJuR3Y3MO1AJDA0TmLZrLkCJ0PzCM1A@mail.gmail.com>
Subject: [REGRESSION] Cannot boot 6.19-rc1 on riscv64 with BPF enabled.
To: Linux regressions mailing list <regressions@lists.linux.dev>, menglong8.dong@gmail.com, ast@kernel.org
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ED5u_kgM8RyM-Ekas5RLRQYgj0XDwbu-0K_Ce2vecok_1766154990
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_063635_429874_AF247EFB 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When booting riscv64 systems with BPF enabled using 6.19-rc1 the
system produces the following panic. I tried on several boards and
they resulted in the same error.

[ 5.380583] Insufficient stack space to handle exception!
[ 5.385986] Task stack: [0xffffffc600020000..0xffffffc600024000]
[ 5.392339] Overflow stack: [0xffffffd7fef7a070..0xffffffd7fef7b070]
[ 5.398693] CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G W
6.19.0-rc1-00001-g74d9cab5b6c1 #15 NONE
[ 5.409302] Tainted: [W]=WARN
[ 5.412271] Hardware name: starfive StarFive VisionFive 2
v1.3B/StarFive VisionFive 2 v1.3B, BIOS 2024.10-rc3 10/01/2024
[ 5.423134] epc : copy_from_kernel_nofault_allowed+0xa/0x28
[ 5.428718] ra : copy_from_kernel_nofault+0x28/0x198
[ 5.433774] epc : ffffffff8024062a ra : ffffffff80240670 sp : ffffffc60001fff0
[ 5.440997] gp : ffffffff82464ce8 tp : 0000000000000000 t0 : ffffffff80024620
[ 5.448219] t1 : ffffffff8017c052 t2 : 0000000000000000 s0 : ffffffc600020030
[ 5.455442] s1 : ffffffd6c2198260 a0 : ffffffd6c2198260 a1 : 0000000000000008
[ 5.462664] a2 : 0000000000000008 a3 : 000000000000009d a4 : 0000000000000000
[ 5.469885] a5 : 0000000000000000 a6 : 0000000000000021 a7 : 0000000000000003
[ 5.477106] s2 : ffffffc600020070 s3 : 0000000000000008 s4 : 0000000000000000
[ 5.484327] s5 : ffffffc600020080 s6 : 0000000000000000 s7 : 0000000000038000
[ 5.491549] s8 : 0000000000008002 s9 : 0000000000380000 s10: ffffffc600023cf8
[ 5.498771] s11: ffffffd6c419bf00 t3 : 0000000077ab9db9 t4 : 00000000113918e7
[ 5.505993] t5 : ffffffff9e9bcc29 t6 : ffffffc600023ad4
[ 5.511304] status: 0000000200000120 badaddr: ffffffc60001fff0 cause:
000000000000000f
[ 5.519221] Kernel panic - not syncing: Kernel stack overflow
[ 5.524967] CPU: 2 UID: 0 PID: 1 Comm: systemd Tainted: G W
6.19.0-rc1-00001-g74d9cab5b6c1 #15 NONE
[ 5.535574] Tainted: [W]=WARN
[ 5.538544] Hardware name: starfive StarFive VisionFive 2
v1.3B/StarFive VisionFive 2 v1.3B, BIOS 2024.10-rc3 10/01/2024
[ 5.549408] Call Trace:
[ 5.551859] [<ffffffff8001e438>] dump_backtrace+0x28/0x38
[ 5.557262] [<ffffffff80002462>] show_stack+0x3a/0x50
[ 5.562317] [<ffffffff80016d02>] dump_stack_lvl+0x5a/0x80
[ 5.567720] [<ffffffff80016d40>] dump_stack+0x18/0x20
[ 5.572776] [<ffffffff80002b7a>] vpanic+0xf2/0x2d0
[ 5.577570] [<ffffffff80002d96>] panic+0x3e/0x48
[ 5.582191] [<ffffffff8001e110>] handle_bad_stack+0x98/0xc0
[ 5.587765] [<ffffffff80240670>] copy_from_kernel_nofault+0x28/0x198
[ 5.594122] SMP: stopping secondary CPUs
[ 5.598070] ---[ end Kernel panic - not syncing: Kernel stack overflow ]---

A bisect identified 47c9214dcb as the problematic commit:
[47c9214dcbea9043ac20441a285c7bb5486b8b2d] bpf: fix the usage of
BPF_TRAMP_F_SKIP_FRAME

This commit reverts cleanly and when building 6.19-rc1 without it I am
able to boot successfully.

A copy of the trace, bisect log, and config used to reproduce the
problem are at:
https://gist.github.com/jmontleon/b8b861352e7b9bc9fd3a93d391926dec

#regzbot introduced: 47c9214dcb

Thank you,
Jason Montleon


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
