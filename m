Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE03606A326
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3YaMHCuN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=koZ8EKVH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GI7sMAMIjn+qLOoge2hoQWpKdgyKvpd/wI9tF+JEigs=; b=3YaMHCuNmQVd2NNcy4Y9XrR5zs
	RMQzs+SZbgKRd6Z7mhg7TFd2NK+45OkYbTZV24zUbTYrISjySiRR+71odGt0tzDGeH8ew8IX/R6ta
	EezcJEmBE+MlUotqyY/gsDViAaHtLtPaJqyKnMJ7K6+fBYSblT+GL++4CSxRoINYlf6F+Ej6mjRua
	+n5HbcycjD4d0thkT3sfaAnHirvtkvHnYrZkKjbULsB6E3g4xkEUVj9a2JrF5u2Iool5g9KiZuGnf
	ACskepSU9bBvD2+qy0bvyrCRpV96Je2Cfs86wOakys14arfNJWUNVbiUnINV03WMOesqCA5yOI3ux
	sQZfN7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGIW-00000002w9X-394k;
	Tue, 03 Nov 2026 15:19:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGI7-00000002vdp-2vu3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:19:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26354575ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719155; x=1794323955; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=koZ8EKVHMFEF6eAJqiJrlUcRRySen7N22dqZB5CjtTZkR+n8Z1NH1cOqcu7k0YF68p
         ivw6gbRpuQnifIcTVLYWEDV59iAIisnnyK4gnkPAmIHQhAoclBJ93agao3VXz4hVCMDf
         AqkjrATdpR9S0BwjTUjQTWA7mFK5w6dg8bWFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719155; x=1794323955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFMfg3/nt4kJ6ByBxDP0S88zpskLBtu8XVaP0ySPO4M=;
        b=1Qo63JtuQ9dTMJXws9f/NIFasyDFbOFV8hbotI8a8X2+oUnDS/j69F+2beZIkbCqDm
         e9zsFJNci4xIvkmhChfUBa9SHZPn6PIfBjGGJTOzoMXQUt1ZJCMssTcUjtamAj42BB/G
         8xE2KKA8qNNnE7aEXoAus66zBaSc/IbzwLZWsJREgqJleYXwtT/w/AghZFsF50jNTh4Q
         izgvlqj+Bm74iT02puGiZ5fsoUa8f90gd2/kAe9tw9BUL9uV4Ll8qWWjvNAyWeQS06dZ
         2knLR3LUjn1VZQmicq3F7DzOs3bdBXiHcQOeraiHVuSqVGaIFUMzGk/2h6YAnUjg4HPv
         VIlQ==
X-Forwarded-Encrypted: i=1; AKwUvByxBuv4PXcN6iW8i22VQPnTDVB5U4VBZE4IX0tPQYCw31hMslSAOuM6oU5QnfW2CfRle0BF7dNpW9OFLA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9QjvBGswcdHRmVHE+mtvHNNxEzYMmvdhiSrvWXIL789x719pZe
	/ZHPY4FUxQ6sKHxyenB8knBd+y7po78Pojzb5tR0su5yJFjvWQDMhMtqAXpv72cVXwk=
X-Gm-Gg: AYBFou2u4MYIII30ckJ1AVdsSjpRrdtYSmwIwHB81COi98ZuP2ytuIrnBFS3f3I3upY
	GsjOtoCvrJBHp4J3VNi5VlqR7Et4s81+2bQdaWCW2QqBKT2ZDLU2AMUM3fS9h7pb+P8SogazDDn
	jERNeASm9YNGfYmGWmf82dVReo6TqB2Aq0DeN7rrxh6yETotqkmLxbt9E7AwboRJ9wFS21IjYiw
	GCqHP/bFgrRiNUy5dBqTNTT9BSYgYztBgmL863jYgvc5alzOMLiJXTzAVBomilh0ObT/NzXAFDS
	9TMThQkhDtMtFFz8GhXf7ggg6FbFmdSIqzKz8qKC8rHfcBxf2PRmhxhBHC2k3Ei6Jru9RiPxUbX
	fIeomIC9jgPvwWxCfNStUZFMHTdYqrXXbKRkehPoPjkqYRChNN3Zm6BjdrGP8VATiLx4ksC/LgJ
	Kh/s7+fuEJ5Islu9Ycjqa0DP+GQwtOhpZKNwnstNoUT6VliKl2nVVQaM7mg8/SxZg1yJUJT6AC9
	Gan41w1HX6e+sOO2xDdNKcMDmZCG/KMUafQZe6JviUXyy7NJdASWqiFIHSZoNzx00+FHN2RzVnZ
	LzdHMKQijAZ6FRsOsBjEDyYNLZMrtdW+WxEoMSdoeiJz2rP49l5jNN54hknFkmTTrsGAMPq/IFO
	gtWH2JVr9tNx6Tca3CpFPNiOv+Tg+Kogau9435tJYfykahGO6+/96SMUDbl0o9OAWt5EuyZ7H
X-Received: by 2002:a17:903:1b2d:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2eb36414d03mr125058495ad.7.1793719154563;
        Tue, 03 Nov 2026 07:19:14 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm42885535ad.32.2026.11.03.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:13 -0800 (PST)
Date: Tue, 3 Nov 2026 23:19:10 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 8/8] selftests/mm: Check that no_mseal_sys_mappings
 unseals system mappings
Message-ID: <053ef1ff0a6a7e5b37109d59a064a7665e087cb0.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071916_033599_EBA030F8 
X-CRM114-Status: GOOD (  15.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Booting with no_mseal_sys_mappings currently makes check_sealed skip and
expect_sealed fail, so nothing checks that the parameter actually turns
sealing off.

So let's check /proc/cmdline for it, and when it's there, expect [vdso]
and the other system mappings to be unsealed rather than skipping or
failing. The vdso tests already expect munmap(), mremap() and mprotect()
to succeed when [vdso] isn't sealed, so that covers what the parameter
allows as well.

Suggested-by: Jeff Xu <jeffxu@google.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/sysmap_is_sealed.c | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index bfa140e01d8a..158e116ca3b4 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -56,6 +56,21 @@ static bool sysmaps_sealed(void)
 	return vdso && check_vmflag_sealed(vdso);
 }
 
+static bool sysmaps_disabled(void)
+{
+	char cmdline[4096];
+	bool disabled = false;
+	FILE *f;
+
+	f = fopen("/proc/cmdline", "r");
+	if (!f)
+		return false;
+	if (fgets(cmdline, sizeof(cmdline), f))
+		disabled = strstr(cmdline, "no_mseal_sys_mappings");
+	fclose(f);
+	return disabled;
+}
+
 /*
  * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
  * mappings either, so check_sealed skips if they aren't sealed. This fails
@@ -63,7 +78,7 @@ static bool sysmaps_sealed(void)
  */
 TEST(expect_sealed)
 {
-	EXPECT_TRUE(sysmaps_sealed());
+	EXPECT_EQ(!sysmaps_disabled(), sysmaps_sealed());
 }
 
 FIXTURE(basic) {
@@ -127,7 +142,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
-	if (!sysmaps_sealed())
+	bool disabled = sysmaps_disabled();
+
+	if (!disabled && !sysmaps_sealed())
 		SKIP(return, "system mappings are not sealed");
 
 	if (!has_mapping(variant->name, self->maps)) {
@@ -135,8 +152,8 @@ TEST_F(basic, check_sealed)
 			variant->name);
 	}
 
-	EXPECT_EQ(variant->sealed,
-		mapping_is_sealed(variant->name, self->maps));
+	EXPECT_EQ(variant->sealed && !disabled,
+		  mapping_is_sealed(variant->name, self->maps));
 };
 
 static void *find_vdso(struct procmap_fd *procmap, size_t *size)
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
