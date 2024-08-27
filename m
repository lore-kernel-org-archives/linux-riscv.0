Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87E6C5472D
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 02:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brUHQXwcrvzxkCDBkQwTwiRCJmePSLF0y+db0IHcH2s=; b=W8/LnwNYDOmTt2
	1eOGVBb34GDIEXhpSsvRclHUrXPhd1T5Y0WdnXObQhworvdm+dmVsPfcHam8nBmbVmoWBzaoRCw6f
	ocyePwIpPY+3bved1HBElcszWocPjif7dMFVE0SaO+4esF6oHPW1BJQuNvyyG1XuWXAUp1fSwAx8q
	wsGs15eMvF3fPLEuAg3ULDeP5YzxzmS3b3VIQ9WLgncN0mdQZSesUgbOCEdRt8P1cd3gaGQ0DkQ24
	e4XZBH6Iw1hvQFdstfb2qRSNC/fpi8PQ8nMZJbbPk20MFYbWDeLU1gJ8bHDwylASpDSJofxysJrgT
	HHHtI2KQogVCfd4b2iDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siltg-00000009RoC-1epe;
	Tue, 27 Aug 2024 02:25:28 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siltG-00000009RiD-1YAY
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 02:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1724725491; bh=6OUVBGQm+R7uNiXYq6N251s4vbehYFjQAwiXtpU9mUU=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=JJfbnUuX/XZN6Eb9v/sfWSL0piwdMMCrdk42jsnWJyVkcdBPzGJYgGoh6X+3Pe0IY
	 LqgZFufheeqnN2as+ZvuNv7ntifw6dLFyuPi1Y0Ca2qhsA8lTtti6Nv7Dz3kJUFDUg
	 I2TI+o0WkOJqt2uBb1AnqXK/Grq7OwMTZIFjej04=
Received: from smtpclient.apple ([2408:8207:18a0:211f:25e9:f22a:88fc:3aa2])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 62AB22D1; Tue, 27 Aug 2024 10:24:42 +0800
X-QQ-mid: xmsmtpt1724725482tyapdnd0p
Message-ID: <tencent_A414DA7D8E69B831317A21368D057C378208@qq.com>
X-QQ-XMAILINFO: MziGzrjZeogZJQ6VsuNCfMEWmzxEuNlCz4qLlbmWD8GXK82Tlhv024UTyHMuIW
	 ZtLBG68GVeE2jivNbSpoKPduTbKnA+QTcfUHwOZl2QERMeWJ6DciXxTfMgN87P4/tt7wNODCLr/i
	 6CgpqzkgKxF9mRHFf9HMTr7+G3qhcMGCTcN+vO9GEHdhaSHYu175P9c/sTybxbQBV1UR2KfEGRg9
	 z+JILA8bxwqIn6bqshESR1mhoJslaizNhds1dwS+WHN+bKVhgr5LmJkOc8ujMu2TnjLE3/DlK7/a
	 dgn11Cpc8JBwRMLLdEfA8jO+Ni8ZXWUQamEgh5MQNDRrXL4PZSjKnA+WDKTiQG8OwqjD0nUKgAM3
	 u2twQqRrjT623mTZypNeVgzrrnzJ2pV9hZhT3Tb+wrl/ht1Pae7pkK3vFOoqNc65+oMnR5V9IUyv
	 2H2UuHGUSFYN8RM6/9d0x3AxBFG+BD+b9eERHZATAnBWC95ib6NXMkBbJ6SQ05KyGSP0kQusTHrc
	 XaP+n002mFehPmr3ObtoHI7j2YLCNa5JTH5ICle0Zb/z2GfrhvkvpZ1C9e7VngM70n4HGtZxdLL3
	 Mys36Um1BmZklMItTEgend+zP/c4Y9/HN758EdpnRw/vV0CW+N746A87dl64wMa8vgl+Ua0sxthN
	 +u1qxQtSJzW/bDEMQzC5w3YxfDdiQK09aYT1F5k9CufRYKuL11RtXdEew7e5dQxGwGKPWQKhHriL
	 SyUAFwWgGoRoPliMkbSTRcLIRTN6a1j+v1fOeIb8HFtfbQafKsqOHkJZ0LdsJozsP+PORMRaXzT7
	 fSepXLJPn9LRMvi6MhyJ4LCXaa2afmBKKeRDAACZ3/1NtFyId5YksShgvRMNyEqlyMlxEgrCtZyN
	 1Ck2VZYyp6HeqKmXKmSVLghYnSh00JCXj7F4BvEWDqbUzaPQi0AzktLd63NDtrvMqhceWreCudxn
	 2n8l8UuXinL3n6S/Hln/mMrRcibbXWIMaU8iK5hYaSdxEruZvqAeITlTElmhSw4Yps++wtc8E=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH 3/3] riscv: mm: Do not restrict mmap address based on hint
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240826-riscv_mmap-v1-3-cd8962afe47f@rivosinc.com>
Date: Tue, 27 Aug 2024 10:24:38 +0800
Cc: Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>,
 Levi Zim <rsworktech@outlook.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kselftest@vger.kernel.org
X-OQ-MSGID: <C5CD5C41-B9C2-42E0-BAC4-AD8A6FE52447@cyyself.name>
References: <20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com>
 <20240826-riscv_mmap-v1-3-cd8962afe47f@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_192505_914691_A7C0998B 
X-CRM114-Status: GOOD (  20.49  )
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



> On Aug 27, 2024, at 00:36, Charlie Jenkins <charlie@rivosinc.com> wrote:
> 
> The hint address should not forcefully restrict the addresses returned
> by mmap as this causes mmap to report ENOMEM when there is memory still
> available.
> 

Fixing in this way will break userspace on Sv57 machines as some
issues mentioned in the patch [1].

I suggest restricting to BIT(47) by default, like patch [2], to
align with kernel behavior on x86 and aarch64, and this does exist
on x86 and aarch64 for quite a long time. In that way, we will also
solve the problem mentioned in the first patch [1], as QEMU enables
Sv57 by default now and will not break userspace.

[1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
[2] https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/

Thanks,
Yangyu Chen

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
> Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
> Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
> ---
> arch/riscv/include/asm/processor.h | 26 ++------------------------
> 1 file changed, 2 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 8702b8721a27..efa1b3519b23 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -14,36 +14,14 @@
> 
> #include <asm/ptrace.h>
> 
> -/*
> - * addr is a hint to the maximum userspace address that mmap should provide, so
> - * this macro needs to return the largest address space available so that
> - * mmap_end < addr, being mmap_end the top of that address space.
> - * See Documentation/arch/riscv/vm-layout.rst for more details.
> - */
> #define arch_get_mmap_end(addr, len, flags) \
> ({ \
> - unsigned long mmap_end; \
> - typeof(addr) _addr = (addr); \
> - if ((_addr) == 0 || is_compat_task() || \
> -    ((_addr + len) > BIT(VA_BITS - 1))) \
> - mmap_end = STACK_TOP_MAX; \
> - else \
> - mmap_end = (_addr + len); \
> - mmap_end; \
> + STACK_TOP_MAX; \
> })
> 
> #define arch_get_mmap_base(addr, base) \
> ({ \
> - unsigned long mmap_base; \
> - typeof(addr) _addr = (addr); \
> - typeof(base) _base = (base); \
> - unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base); \
> - if ((_addr) == 0 || is_compat_task() || \
> -    ((_addr + len) > BIT(VA_BITS - 1))) \
> - mmap_base = (_base); \
> - else \
> - mmap_base = (_addr + len) - rnd_gap; \
> - mmap_base; \
> + base; \
> })
> 
> #ifdef CONFIG_64BIT
> 
> -- 
> 2.45.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
