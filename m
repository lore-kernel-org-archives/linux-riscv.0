Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEA3606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Q3tSOR8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C24m/7sU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UK4V0sno3iHanjYzW9kcaHA5QoD37g492Jo2afmKqKs=; b=1Q3tSOR8oiMaGedBEsTxp5ABxr
	ZGiL+/QtBG9b+b5cp2DWkid/AdFjleb2n0Tp3b6JYc/ZqDo/KWWIHdgNkEkImY5U5uIJ2HRr3I3Al
	mfq6Zg+nDpq7v0iVxjY9+KlPUCDw6BQtILnYJ4x+p/ueo78V0s9YPGd8zyYXlYkPHRM5RmxBw0fTS
	x8fxtUVqZLyFqg9B210IJFXCcB/ulTtQo9r8mUj3IevJ9PkzhgkouK5Qv3BoQjsu0wYK0NXrP7CrC
	Ao3r4jsfu22kgniYMmcCpkx0CCZi+xj4dTBmyI6nkh53yDCWzH3USv6SkgwVGp3oH+evNOBI9jFy2
	PcrRme9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdS-00000001fpO-3lVO;
	Mon, 26 Oct 2026 03:44:34 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBdQ-00000001fnf-1Nmu
	for linux-riscv@lists.infradead.org;
	Mon, 26 Oct 2026 03:44:33 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-5365b48238dso20426691cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986270; x=1793591070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=C24m/7sUHKZVbj3+vBdPzl8+UkklUV22nk+HzKV/nuO1l/M264pFRqof/JURC31usj
         TF3N4S5Jx0x+ANcPxgrZwYTLbof7YN8XHK1dSZVn10uIdtEmZGlRfFe2R05zUeTMMva7
         19+M8BqO/Aa1EDF56ocusPbjdhiQLUKIANkytXslAAgk/ZCcBe3VrDHyMVSAuEFxI2bX
         VGtKtcpkYpX9r2mvDlfn598Jza8zjzCUJmbHHvQpeE41UbfaFYta28z/Z9uRmK99TRLN
         PP0AsAeTxnyPOnqAQL4bXi1rpsJexYcw+0EqldMusehGIBs1on9BKj0HKVn4Jeo8sGQF
         pV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986270; x=1793591070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FuZU9Bm4L1tjpR5OE6ZUvzPtHgo0PRLa1bH4/fzLGaA=;
        b=MsdZ6gfsAwVxl0pIgZIPANs6LcQXNfIu8PK9S5HPfa+v1Pe3jQt8S+ByxJsZknNrcO
         AGGGB9Od1nqO0P2pBWaYW3akoc3XHfZKgdMUlvSWUrA8uHq0pKQNj88afGUsQL5hRwjn
         Ip5N/ZTNoqQ+40K0Lpz8puRvlMEfMxDcmkBZpg1f38tzmtMXqEHL3zWa3y5D1eyCjhAr
         VjsJDF8gamB0zTvkLvc6u1d++3a/zAbCI/oSsTQkne2lnwVfT04F3JYjFjiLg7IlVNYa
         6oT7oy7EW08pOVCHz+kHaTIBCqkoChCMKTQiDK/5okx6Nl2hSPh8Q6oTrLCJTsZNwjOa
         gPjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwXzIunUhkZEHURZECc7Wkbi3B3OjjDUb4/VnE4oHxg9XjKOS254JaJHiTvRLhK67Znht9MzvM3rMaRTg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLS+PB7p2eX3Ha/slTlA/50V2JMZXblYmiB9V6xjZb9tl++5QPY
	tfueI9mDugEzdyAbibLWOCYq8xw/1PVzAfRgINh5f8ALICyT6YJObmUG
X-Gm-Gg: AYBFou1lri0CCxytO6vK3nj1gOXaRwk3mi0VZVdxsFqsJBAf6GlU/hRwnyo9YS412sM
	a/KFW0QqTVv1b1zrK4ZNlM/pi4Gu9vNqabbxf9Ps3KojhLXvDH/Dr6IuFFGdYGbGSqx/X0BI1t+
	FCLm8Cj3TQHbZg7Dohdwhz86FVKCLia5vdeiLMi+wx558wnMYuI0TTsKnsjgkdCXemK1H7DD4UM
	8KBUX/jecrdbR3SJjCcADzkgJOHMI+8cmJ/LYLTghuOyDbA/Ff8Qc3I+V9hMLGkfX62AosKztPD
	Uz3UyiNQGtx/xh4tbx5ZgaovDtLoj1n71mFJ9fHltBzfuMDJO5WakGFB8003i0KCZwVy1/xFZuh
	KRcBsLq/yY3ICgoChOaZvzpR6WP7fNANn2KuyJ6q9Besp5Sn+9czNYjdRyFG5NhRI36TxLjVX9x
	DLyHLeF50DIC71iAPp0oO/+QOTz92UeVePnIJRSGs/9pVuz8DgOOtHMqJKnuCXfGj9skdW8L6EO
	RDwUk3dSQMdVA4VL2jC/E9PncYjI2jwwSYfEUn5yXRlnWKImqGKgdiP+ytw/YrDnbHpVqa9bsil
	RFdyK/rvobIF9r+c/yDpskzOla30rlIodX2+cS8AtrAE3CXvKXqO1F+lRrwq
X-Received: by 2002:ac8:6546:0:b0:536:699d:9a1c with SMTP id d75a77b69052e-5383b3509cdmr79585421cf.2.1792986270529;
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:4cc4:d0be:4ab6:9a0b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c5273sm46202121cf.9.2026.10.25.20.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:44:30 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH 0/2] KVM: riscv: Unify and optimize FP register loops
Date: Sun, 25 Oct 2026 23:41:25 -0400
Message-ID: <cover.1792982932.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_204432_379175_5D917DD5 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The change to both patches in this series is a 
structural/architectural one. Both functions set_reg and get_reg use 
identical code to locate the register the application specified in the 
token even though they do different things with that location 
information: the set_reg function adds data the application requested 
to send to that identified location  (in the copy_from_user function) 
while the get_reg function retrieves what data is at that identified 
location and sends it to the application (using the copy_to_user 
function). Everything else is the same. That is the only difference 
between the code. 

Therefore I was able to apply the same solution to both of the 
function's finding-the-requested-register parts (which is everything 
up until the final if statement) which were filled with redundancy. 
The solution I came up with is to create local variables for the 
entire function for all the variables of the original code that would 
be different, depending on the floating point type. Then once I ask 
whether it is a double floating point or single floating point mode, I 
assign the aforementioned variables to the values they should have for 
that mode so that when I go through the if statements that ask whether 
the requested register number is a status control register or data 
register, I only have to go through it once because the respective 
floating point values/addresses would have been assigned to the 
aforementioned local variables, so the whole code kind of changes or 
is tailored to the floating point type. 

This architectural change/solution will make the cpu execute the code 
faster (as the cpu will have less decisions to make and the bare-metal 
math used to figure out the address of the register is executed faster 
by the cpu than looking up object properties and array indexes), is 
more maintainable, and is more readable.

Paul White (2):
  KVM: riscv: Eliminate redundancy in get_reg function via pointers
  KVM: riscv: Eliminate redundancy in set_reg function via pointers

 arch/riscv/kvm/vcpu_fp.c | 128 +++++++++++++++++++++++----------------
 1 file changed, 76 insertions(+), 52 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
