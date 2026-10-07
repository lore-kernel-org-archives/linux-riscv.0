Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE0CCA5FFC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 14:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lteJbOuuJYRGR6+4ZZAcYYNo/IS+diX4dvfnKkPXdmM=; b=VmTwXqQru6uAwJ
	k4wzCFbhlAN3MnRW35QILdtJ+wQysd3tncpjMobFijwiTdsORkVhS5XGu8k/UFlyOYDXOIGNXRSPq
	oARabMyzYpZwVxnHKPy8AGHlbcCepodQQMi32YHvy0LtFmbLeawzp78ami4QVsqSgy3r/EPeEg1Ua
	QqZlOOC6DQMnvPiy+1Aq2FSEl1UKbH/DL9C+Y0K/4ShIEYUtp50y3E4Si1TSnde8KOK3+8LTO8+s+
	GQVf5dZCtM/yBGcJyNXPrK5ZV8iIDRxwVvWudXwpLO1eJnDIwECT3mV93FQ25ant6cWsfPKhhpq3Y
	1nQsmELRh46EiSetL/Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESRG-00000002b68-28lF;
	Wed, 07 Oct 2026 14:16:12 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xESRC-00000002b5V-2AU2
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 14:16:09 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-93e6f83f0bbso145389585a.2
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 07:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791382565; x=1791987365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRti667jeSRhARCPDfXNMpJ3JE2wRVrSoYMAVxfOv7Y=;
        b=ImI5UBUG2oGmYWsId0rB6VeYxxy/8opLWwI4NmRr1YXw1wT6EOCcl8JenvRUMMreij
         Y9yVkiBZQLBd4O2hCE31auXLFobXisKG3D4Da9ny8oQSPufO6JMAanhxOBs98LmmgGVA
         C+8yQmiIFo1RGqyxvxegUTcb8A4UCBcksljwk5ygXgZSmAYLS805nqn7Y0gGWE9nad/V
         weBFS102VW5w8w+tq2YLaPJTET75gNtb6e4Xo2DZfhGrTSU5GpxTXOLqgCVxOxQST3ef
         /nNR1ZbJKPj/ll8SdPmHSroxD6njznsPrTO/hH1XzbNzEbcX0P8bN9Rr1XSKfbAW6Q5Z
         q86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791382565; x=1791987365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRti667jeSRhARCPDfXNMpJ3JE2wRVrSoYMAVxfOv7Y=;
        b=Z3D5Wo4h4aKGVbcPsXgasE85GYxCbHbvewqeXMcki/5R1lvWUmgJJhByvlr1mPXovi
         HiSrZzVn244fnZhB74cJiKbde4/7WLc857fqHZA+1DxIC8Bw09S7MH2VXA/86UPTqtS7
         sUlUf/7Exbo1mWavL1N7JHGkdmjubPG2ZxNlZViCbxaueJN/9aWad/JavdVr211zmkxd
         ReRGFpP3KW3bImcUvafrXR0FedQ1pvQOflYuTnF+QblrWq0TuNRchZVLBQ6sdJ+PwCLf
         fC6lD/jY1t7SWiTKj1lHdBm7gCAralIyeEzQgeZaecC++8LacqJ89ZPmbZjf3P+g/IwX
         9FtA==
X-Forwarded-Encrypted: i=1; AKwUvBwO6PnKm4iz4rwUNw8D3A6kdGLDgQEi/CftmpkaC4SHEzmN25NVwHEaVPMrJ5Mslk7/xAgUILjGFCZMGg==@lists.infradead.org
X-Gm-Message-State: AFuF++lYk8FoG4imW6xQ+0jEjcju2geUJP5ihL+etkDJd9OrenSeuv2k
	wGbqqaxV839GFzPTh/pdVFNJy3Bf2jUqTwNJVEHoPUU/6QOHi3qkb7E4
X-Gm-Gg: AYBFou16LiU5QtWsWe6/DK8xDA9/bRAVEk9bl9F4YoiWUCCiYFv5WrR6krpH22mxAYL
	nY5iIP/b4YfVvrWTgdPcgKeFed/lX5U/xztFoyDzSirjVR9fidQib0XzMrBuJgu0woTDsiczTug
	2r9nNi+4nOhCvVoRgRuPbczHJSI56seNWoxlgXqYTEA+vO9GPTZ7J5nDmrwzuTOpL2TjQ31RG5J
	umuCJFqHuI8S+6ZlVpumxA47tB/ARytE6yWD+OIhttclBSOpS681qQw1FOBSdKU6TpETl2Oud36
	BKf7Y4RmTxhfJoKR8yBKrrugeBX8D1g2V7/EhjFg+DJm+iX015klvuNcPHrmLvhHgw3AIdMQV3T
	zhOzSw+AvtR9Cz6D3nfWUoG8A6Y5kjpdpy1wW0ERM0ID3Y5d/c/7zt+mOlB5oGWj3YZLqeYrD/F
	3peL3T+jql3eugr8aLFzFCRfrWE0mgav2NnFB96CUB4MbJk0zpH30vSRy8y8S4/6BNyykpYPb+I
	N7UfD/kXLqyNBf4j/qz4jQ6xwqmxbfmlyaRc8HUW4NEKDuvv1dPMLNLES9CHfyOy0ZEIsT9vS3N
	Hz8lonPJ
X-Received: by 2002:a05:620a:4629:b0:93e:96cb:3083 with SMTP id af79cd13be357-93e9b76d319mr419482085a.33.1791382564280;
        Wed, 07 Oct 2026 07:16:04 -0700 (PDT)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e99104308sm229406385a.16.2026.10.07.07.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:16:03 -0700 (PDT)
From: Ziyi Guo <guoziyi114@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com,
	thecharlesjenkins@gmail.com
Cc: debug@rivosinc.com,
	zong.li@sifive.com,
	vulab@iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <guoziyi114@gmail.com>
Subject: [PATCH] riscv: refuse PMLEN=16 when its tag bits overlap the canonical VA sign bit
Date: Wed,  7 Oct 2026 14:15:58 +0000
Message-Id: <20261007141558.2914604-1-guoziyi114@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_071606_684250_26F949A9 
X-CRM114-Status: GOOD (  13.28  )
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

The tagged address ABI lets userspace enable pointer masking (Supm) and
request a PMLEN of 7 or 16.  access_ok() validates untagged_addr(ptr),
which strips the top PMLEN bits and sign-extends from bit 63 - PMLEN.
Supervisor-mode accesses are not subject to the U-mode pointer masking,
so any site that dereferences a user pointer without re-applying
untagged_addr() -- e.g. the futex atomics and the unsafe_*() accessors,
operates on the raw, still-tagged address.

When the canonical VA sign bit (bit VA_BITS - 1) falls inside the masked
tag field, i.e. VA_BITS > 64 - PMLEN, an unprivileged task can craft a
pointer whose untagged form is a valid user address (so access_ok()
passes) but whose raw form is a canonical *kernel* VA.  Among the
supported configurations this is only Sv57 + PMLEN=16 (48 < 57): the tag
field [63:48] covers the Sv57 sign bit (56), so the pointer can name any
address in the linear map and a raw dereference becomes an arbitrary
kernel read/write.  Sv39/Sv48 are not reachable (the raw address is
non-canonical and faults) and Sv57 + PMLEN=7 is fine (the tag stays
above the sign bit).

It is triggerable and can be reproduced today under QEMU, which emulates
Supm and Sv57 (tested with qemu-system-riscv64 11.1.0, -cpu
rv64,sv57=on,supm=on): on an otherwise unmodified kernel an unprivileged
prctl(PR_SET_TAGGED_ADDR_CTRL, PMLEN=16) succeeds, after which a futex on
a tagged linear-map pointer, whose untagged form passes access_ok(), 
performs the atomic on the kernel address.

Only advertise PMLEN=16 when its tag bits sit entirely above the
canonical VA sign bit (PMLEN <= 64 - VA_BITS).  have_user_pmlen_16 is the
single gate used by both the prctl() and ptrace() paths, so this closes
the reachability for every such accessor at once.

This bounds reachability rather than fixing the individual raw
dereferences; the futex / unsafe_*() paths should additionally untag the
user pointer after access_ok() so that tagged pointers work there as the
ABI intends.

Link: https://lore.kernel.org/all/a25d01cd-e21d-4e51-9d24-6cc41589c041@sifive.com/
Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
Signed-off-by: Ziyi Guo <guoziyi114@gmail.com>
---
 arch/riscv/kernel/process.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7cc5a6a5c020..afaeaaa247c2 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -433,7 +433,16 @@ static int __init tagged_addr_init(void)
 	 */
 	csr_clear(CSR_ENVCFG, ENVCFG_PMM);
 	have_user_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
-	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	/*
+	 * PMLEN=16 masks bits [63:48].  On Sv57 that overlaps the canonical VA
+	 * sign bit (bit 56), so a tagged user pointer whose untagged form
+	 * passes access_ok() can still name a canonical kernel VA when
+	 * dereferenced raw (the futex and unsafe_*() accessors do exactly
+	 * that).  Only offer a PMLEN whose tag bits stay above the sign bit,
+	 * i.e. PMLEN <= 64 - VA_BITS; this refuses only Sv57 + PMLEN=16.
+	 */
+	have_user_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16) &&
+			     VA_BITS <= 64 - PMLEN_16;
 
 	if (!register_sysctl("abi", tagged_addr_sysctl_table))
 		return -EINVAL;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
