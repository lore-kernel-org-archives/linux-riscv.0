Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12E6C02193
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 22:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33QWfCPZa9s3gG7HcFv3ZPqwkxWJD8H/1RZ/uVWByCI=; b=e6i6fYSuEjot+s
	a1oVQ7d6JJWAqu0fksRoKK/CN3OXDWKPxGa5WojN8/AvMO8Z5IvcmiZwOycx+NZ6q+WkXYJXvUNAH
	urRKJVov7zLn3MObVHSvuORRkCQmOtLpDFiPL9tJJdHywGdlVegHiaZ5H3XULepoNxjPTjNW8j/uV
	hOSz9o+5Pr2+gUaub2u9KBvUuI2L4Zd/qJc6I4n1pFrvxiJidqQaj0HqFFdI3Yp2AryezeBoMtfaY
	P1MJu7y1nu0JuEQdir1lz+x2rPgqZrP19Ay8CZn70Fj1h+EVKDnniQepoYDUBtHQ2Y2H26xtHBuYn
	rALVljFacohddt7KHbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQyv-00000001et5-49pQ;
	Tue, 04 Feb 2025 22:01:21 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQyt-00000001esj-1BRB;
	Tue, 04 Feb 2025 22:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738695503;
	bh=L7hZ7sYPCCjt4cWuKdRqkFzNU2NINe/kZtlYF3GX+To=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jyGtOg/iCyiwjp/g1mTcKme1MwefVaOX7wySyrZcham7FrqcugOECEhMIB5bHuVxw
	 jxBiJ9xi5y9Ou8aDKij09mJEeZ7EVO+B4CuJIYNSPaLeZ0McyYcgp8ncn+IliZWl8N
	 HZraV3iO1ZSruE8vDNlj7sXOI+AYMSwijILKB/nU=
Received: by gentwo.org (Postfix, from userid 1003)
	id EC29D401EB; Tue,  4 Feb 2025 10:58:23 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E915A401E9;
	Tue,  4 Feb 2025 10:58:23 -0800 (PST)
Date: Tue, 4 Feb 2025 10:58:23 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
    palmer@dabbelt.com, tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, 
    ardb@kernel.org, dave.hansen@linux.intel.com, jgross@suse.com, 
    will@kernel.org, akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Message-ID: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_140119_352818_6DC1EA7E 
X-CRM114-Status: UNSURE (   6.44  )
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

ARM64 supports MTE which is hardware support for tagging 16 byte granules
and verification of tags in pointers all in hardware and on some platforms
with *no* performance penalty since the tag is stored in the ECC areas of
DRAM and verified at the same time as the ECC.

Could we get support for that? This would allow us to enable tag checking
in production systems without performance penalty and no memory overhead.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
