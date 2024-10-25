Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E7DD149F3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPsb6BO+bm8gtnvgDms0DrHD7h9czHx3b2dgAgD4j78=; b=QNoWTXgsdgMb0D
	p3xHVXBdAM6VDbd0Vv0I2R4bTlCwYAsDhIlCu9BIrQy5nqsvTW5AnUQmEh6DbEUfLKENGwn2kmfPP
	tRcAA4Bz/0l64T1v2A5dm4vzHP2IiQmmrk6Fy39Tn7zm+1NLEyi3SstMH87o0KU+aI4fwLGvAUD/D
	OdfxufWX2mpHL0Tay4gmdpBX2+3I2+kDnwYXZRbTfF5/YpMh5nb08l/acmesvU/ctlDBfHFBzjuRo
	x5BPclVWULW/a+Qg/D2/XU/jDtKrnfvQwsz5TIb+E2rnE737xqaGXfqGiWX8WclCbRcxGzbQeVQOt
	YSGGgaUrFkcIWDebxa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SJy-00000005NoW-3G5B;
	Fri, 25 Oct 2024 21:58:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4SJw-00000005Nnu-1fS9
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 21:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7249C5C5C97;
	Fri, 25 Oct 2024 21:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F67CC4CEC3;
	Fri, 25 Oct 2024 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729893491;
	bh=WaXT3N54W0je/Mf9JECHTQKvU4XqvFR6omMZdeIU/jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1jKf998y+TKcDBxoZWO7Srjy5BxeZPsExybQKizrFgk+PpkacomWzjgPfi2gZX0k
	 GcV3gQnWT1lPzWgsffOADNQ1fYIQqY51/TGmJnqELBkll4fPmWTI5e8Y0irEkljl8i
	 3ufBer3vuNsxiQZ3DWkt1yCS+hMNJjqOy5hix5omzsjZAPm2qtwTme6k4zLUXmlZlK
	 tnEN7HjR0+nGbi7IG5otQ1P8q9KQsFiBwNi6CLKgl3q/Gt0ALdaYMOK3MwWLwGbGux
	 UHsSQXY2PXI2ef+EUxp/i2+s5Wa2PGwfakGdpyOee8kEE8274hT53ajG44fJdG2gOq
	 L7RL4siXZj7ZA==
Date: Fri, 25 Oct 2024 16:58:10 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, rick.p.edgecombe@intel.com,
	richard.henderson@linaro.org, cleger@rivosinc.com,
	alexghiti@rivosinc.com, Eric Biederman <ebiederm@xmission.com>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	samitolvanen@google.com, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>, atishp@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, evan@rivosinc.com,
	x86@kernel.org, Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org, alistair.francis@wdc.com,
	broonie@kernel.org, Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kselftest@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
	linux-riscv@lists.infradead.org, charlie@rivosinc.com,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <kees@kernel.org>, andybnac@gmail.com,
	linux-fsdevel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Christian Brauner <brauner@kernel.org>, kito.cheng@sifive.com,
	Borislav Petkov <bp@alien8.de>, jim.shu@sifive.com
Subject: Re: [PATCH v6 07/33] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Message-ID: <172989348946.964081.3884883100574600652.robh@kernel.org>
References: <20241008-v5_user_cfi_series-v6-0-60d9fe073f37@rivosinc.com>
 <20241008-v5_user_cfi_series-v6-7-60d9fe073f37@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008-v5_user_cfi_series-v6-7-60d9fe073f37@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_145812_501464_37E7A9AA 
X-CRM114-Status: UNSURE (   9.72  )
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


On Tue, 08 Oct 2024 15:36:49 -0700, Deepak Gupta wrote:
> Make an entry for cfi extensions in extensions.yaml.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
