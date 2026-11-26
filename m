Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB4606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 00:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kVpbkP5G;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Ks5FU4sb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7x2HMJjfppiZVXiVhD5F4FfoBsD4QiT8QH+TOjF9Hjk=; b=kVpbkP5GEOsxxFIsAO5MaRVqHV
	pIw2jxLkyB51sVRD985XXVbiNfiToSUaic0FPFOiLLTxkBt9CR71KOvtDG4IDB/GNxkZV4xxSLxIO
	UlzWbK0wWB21E+uou188p2SDGKzSVO8d3b5d+a13nDbLiiCzTL2V6mXfZJkk5hROAT+rLoGfHYmQs
	mwUJjqkHLaSLDNhMYNF8DKtrn5+AGKvinQbLmQJYRkEY2McWmih1alwg1004kG3brXzle6rkwBX2+
	cF/yABozRE7X/iwXUGt42jDWXz7B9IdG62U9H40ZScJK/p1vqJpqfBX9otP5mlhFTV/GoHavW0Hz/
	l0oP9M7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNDR-0000000Be5E-12bb;
	Thu, 26 Nov 2026 00:19:57 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNDM-0000000Be4V-3fSZ;
	Thu, 26 Nov 2026 00:19:56 +0000
Received: from pps.filterd (m0528005.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APM1kCF3576277;
	Wed, 25 Nov 2026 16:19:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=47SGSR6ZUVrtGx0g8gnswzV2LPBUE2QF9Cyhi
	0n7410=; b=Ks5FU4sbySDCKunlTvbAdvA/t9TuQLQx7xnp7YpZZkvjiYahjznbz
	4Rlgy1WUjWHkUo13eBjUVbJBu0Jakan9yS7hS1rqVk6M6zUNwuThICsRwbWcyBMq
	akticnfM/L10XIb8YSNgG2U6VG+afeEV6ctQ0TOdE8Ub2XcWTazhvwzJMSQC2yfh
	zgniKQTut1Urz3y09A9QDcMapMhgnB5JmOCBJv7Q8pQbrlt/kVbJcIDKjUD1xTCI
	GoZdA4gR3+2tv+v/NQ+UNrmSrmy7OJWGxrfpi/Egzsh2CEfI7DbIOmyaNCwDDKhZ
	Gu9uDc7vjpWLWdmjPKS3z+P8fDeFe6H+Q==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j5fap21f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Nov 2026 16:19:33 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Thu, 26 Nov
 2026 00:19:32 +0000
From: Yann Collet <cyan@meta.com>
To: Ping Li <leeonion.muyu@gmail.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <palmer@dabbelt.com>,
        <pjw@kernel.org>, <mark.rutland@arm.com>, <alex@ghiti.fr>,
        <emil.renner.berthing@canonical.com>, <masahiroy@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-boot@lists.denx.de>
Subject: Re: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Wed, 25 Nov 2026 16:19:20 -0800
Message-ID: <20261126001920.3185323-1-cyan@meta.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
References: <20261124065650.1968930-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwMCBTYWx0ZWRfXxbv/lVsq1VIk
 U0jO68Ek/ZgfsEsUosNAmLzdC0VirBIXx78XSk+Fq5RBm4+k+1rivqMjUwr/JkjKwBGgwoKINcO
 a4kq3jm6yvQ2sBdXF+SU4cakzZ6pnOepGKRJDu1NeVNYuwKJmgbtH7Mrx8EAxxJnO1cGA0sXjX/
 nj4MHBy+g4FoIEjN+4fGSAeqd/V/Kel7rj/LdJecWNWCSNww9ik9cUFbad76xX0ls2vQbJd1BLx
 5dW+FdHymNwf9Sl0rs8NbC4V/61pQazg0IU4+0DXbwpegELioNusqRinOqQKUOWxp7SLDI7Nlft
 3fy/YX2LE9cUOMAmzPoE07vqhXYJfsMRthxXPffT6gQgf8M5Svch6btsT+/8xdfit9hjyJng4l7
 wI6g6IVUFIwzhT66lqD8HdZjLZ4nIDw1EL2obwB/PLSLIOI4R3tQ+VVT9Mf7jNGU73f9dBsO27e
 MSMKyS9OcP5ruNhA4ug==
X-Proofpoint-ORIG-GUID: HS-aMb4GaL-DcgH4Ivl2FAW5exzSSANa
X-Proofpoint-GUID: HS-aMb4GaL-DcgH4Ivl2FAW5exzSSANa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwMCBTYWx0ZWRfX18KQ9ZGKAbE+
 EVc4wzDNAFesY8zM3PWxWiU6yVP0JKrGdiVtGhN38mn44y0pozgkQN+/oLGAxKto4lOyJKFdCaC
 vfgZhIH/NKuJvP6fN1xWWLSDEmEJZVo=
X-Authority-Analysis: v=2.4 cv=Eexd0/mC c=1 sm=1 tr=0 ts=6b077b15 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=jCddH8ec0KUNCymVuxII:22 a=I0HTz2J1b6gKnfYguBMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_161953_094283_52F6DE17 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 02:56:48PM +0800, Ping Li wrote:
> arm64 and riscv also build Image.lz4 with the plain cmd_lz4, but a
> compressed boot image on these two architectures is not decompressed
> by the kernel itself - it is handed to the bootloader.  U-Boot, which
> implements this via the 'booti' compressed-kernel path (boot/image.c
> image_decomp -> lib/lz4_wrapper.c ulz4fn), only accepts the standard
> LZ4 frame (magic 0x184D2204) and returns -EPROTONOSUPPORT for
> anything else.

U-Boot's decoder has a second requirement: independent blocks. It
rejects frames with linked blocks, and the new rules rely on
independent blocks being the default of the lz4 CLI. lz4 is considering
linked blocks by default in a future version. U-Boot can learn to
accept them, but bootloaders already deployed won't.

Passing -BI makes the output independent of that default:

	cmd_lz4_std = cat $(real-prereqs) | $(LZ4) -9 -BI - - > $@

With current lz4 versions, the output is unchanged. One caveat: -BI
exists since lz4 v1.9.0 (2019). Older versions, still found on some
build hosts (lz4 1.8.3 on RHEL 8), reject it, but they produce
independent blocks by default anyway. So the rule can pass -BI only
when lz4 accepts it: 'lz4 -BI -V' fails on these older versions.

Yann

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
