Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E66E668AA
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 00:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUwaX8B3htG4Zlgz46VCeFMqb3qmp/c2oM5qUfZ+iuY=; b=PYSzx+pkZs0pGIGSO/iHtyoUVS
	WTp40o7boMpsBRrD0vQhlrUdcCTKWwDSoO/YPIsvrHpn+wLOjPPYvhe1FWnSdDWU0dKSryZoE4VjR
	gBCf1tjgm0hS8IV3ndGUhKB8GbZ34gt5E92ms/FgFZQkVaf7oL2Wpm0t3vlsNBmtrLiiIq2Vz6MX4
	m7JJwrnmx1sHnzrYypnstM2gIRFNqVGDo7OBSgzhOL4dLMNMIswnELDA/BXAKxqWq+fY7S8XSHlVg
	A/SAGNbyVDuK40KVrdMBYjz15CbnJtk+fvs+qEWim/WNvckf+52ikqqoOuaSdmJkUzrEj72598CMj
	yNOQT3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWl50-0000000B8ij-3Oo0;
	Sat, 20 Dec 2025 00:44:18 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWl4x-0000000B8iN-2sUq
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 00:44:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c0224fd2a92so2206057a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 16:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766191454; x=1766796254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P/8kx/M1nrXRtnwnfrxnvdy6PkP+kKEmVmM6wEDeCHs=;
        b=ZCWQYMgwDeXhvLaE5xCoYZ3l65I+L4DZFLxJFsZETgEdBTUyQfdm6bTU3WaALMwW4Z
         iqDaQmtbeRbLPPvOALoZ5jbycBiPNIZs39SoCdk8ar+gSfjk9sqfA3aUXJbx11Af0Qzf
         jbG+30qKiKvMHAJBuognaPDwgzxmJdTNdY93Bp/whXRJpSMve2tYMZ+j0CrSFsMftz4z
         O+ag/OPBiHUiSES4ZkJJ1De2j9AfsHf7fkU+OVsMXAvdZPEqDeEbsl9tV9Bio4mfJwjN
         EhrNhEHWKkmyxSzXYS/SIp7Xu2chUwOVMZj+0ljAB9ugskxTOl//TREGLZesBpXX6GLq
         Y03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766191454; x=1766796254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/8kx/M1nrXRtnwnfrxnvdy6PkP+kKEmVmM6wEDeCHs=;
        b=gjnR59Cjc7K0jQ4dXXPYqa0VUoKRRMd5MMJoCAcoGMfdBFdGxCfXofCQTBCT1l52ZY
         +1igMg+PT/EFwhMDjGjqI/HO8aTsXIqP/B9wpc8NjEv9JWbWlDEgLWsECD1+Gjvu0ux7
         3JWOMQgYO9M2YygbPRB7YIU4+icHx755EERBySudzRcmJQdPQjyRwIBAKSxz/FiBKasc
         veGMv19tAm2kmIjlelFdFrOAV8znweTTzH25K8c87lC4oVur06SAnUfJrfrnhQsNZcOl
         fQZu6FI/y+6J9eQaQEYststTYbHcXzfRfHNru9pYtthe/pPwZf2IMOWqJKts1FG3ouUs
         9Spw==
X-Gm-Message-State: AOJu0YxJWlqRBgGGrFWFybX9dTBHGLEenWrRKoERfEbdTJeN8PAw3zLh
	HegtGoyKNXJhCbW5oGXZZAE1lxnjefIAX8/IJOC2Iv7d921rWBOfO38hb+eH+Rmrvdw=
X-Gm-Gg: AY/fxX7ZrHtQVhBmPWJr7KZKJUG5YzekLjVeJ3ZjuJh6qyeUrzDGb0/kNwi7EOdkm/I
	q9eF17yRu7S3Zn4fkkdOcobwMUzr8YdFLkLDwrfrNuRI/nzEIbVPcPIecMDGg8RE5IDsRsBGoaH
	wO4KB4b8YIlB3JomJIdIt2KjX3hqwGKDhXBJPv6JD1U+WcKq8cyYc2UcOEGeIXwFzTJgvd0kh7j
	hlg109mnnm2W4+ZoloUfgzBqBS1LHBDPUDdO5tRfGPwkQVf0WsNqYfjKvhucdEUrQQfL9DjoJh3
	zpJKNgQRL9I8gV1cpl8uhjYlrAn2n9pCaW0ehRWXpohT9KIkQjpJwcvpY1Isae1aGNDQONdiBMI
	vBlRIVbS54tbMX6EfYXcqQcKoK+qhifz+XMjptc+3P9y2XAU+pe0J8nhcOzG2QUogC3DtV9TUPR
	GR5WonmoN/J8E2SjJBiiKz
X-Google-Smtp-Source: AGHT+IGQ9Xf8u3fzSjcxDQY+hRqGmy1S7WedKxgBFmGE+PlqzWjQNgnEDl3N9BanKQvdtJFxGNV8fw==
X-Received: by 2002:a05:693c:631c:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2b05ec0313cmr5099555eec.11.1766191454009;
        Fri, 19 Dec 2025 16:44:14 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b06a046e99sm6918829eec.6.2025.12.19.16.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 16:44:13 -0800 (PST)
Date: Fri, 19 Dec 2025 16:44:11 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org,
	daniel.weber@cispa.de, michael.schwarz@cispa.de,
	marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be
Subject: Re: [PATCH 1/2] riscv: Use pointer masking to limit uaccess
 speculation
Message-ID: <aUXxW3iZOClLNofi@debug.ba.rivosinc.com>
References: <20251218191332.35849-1-lukas.gerlach@cispa.de>
 <20251218191332.35849-2-lukas.gerlach@cispa.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218191332.35849-2-lukas.gerlach@cispa.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_164415_894019_4FF0D62B 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 18, 2025 at 08:13:31PM +0100, Lukas Gerlach wrote:
>Similarly to x86 and arm64, mitigate speculation past an access_ok()
>check by masking the pointer before use.
>
>On RISC-V, user addresses have the MSB clear while kernel addresses
>have the MSB set. The uaccess_mask_ptr() function clears the MSB,
>ensuring any kernel pointer becomes invalid and will fault, while
>valid user pointers remain unchanged. This prevents speculative
>access to kernel memory via user copy functions.
>
>The masking is applied to __get_user, __put_user, raw_copy_from_user,
>raw_copy_to_user, clear_user, and the unsafe_* variants.
>
>Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
>---
> arch/riscv/include/asm/uaccess.h | 41 +++++++++++++++++++++++++-------
> 1 file changed, 32 insertions(+), 9 deletions(-)
>
>diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
>index 36bba6720c26..ceee1d62ff9b 100644
>--- a/arch/riscv/include/asm/uaccess.h
>+++ b/arch/riscv/include/asm/uaccess.h
>@@ -74,6 +74,23 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm, unsigne
> #define __typefits(x, type, not) \
> 	__builtin_choose_expr(sizeof(x) <= sizeof(type), (unsigned type)0, not)
>
>+/*
>+ * Sanitize a uaccess pointer such that it cannot reach any kernel address.
>+ *
>+ * On RISC-V, virtual addresses are sign-extended from the top implemented bit.
>+ * User addresses have the MSB clear; kernel addresses have the MSB set.
>+ * Clearing the MSB ensures any kernel pointer becomes non-canonical and will
>+ * fault, while valid user pointers remain unchanged.
>+ */
>+#define uaccess_mask_ptr(ptr) ((__typeof__(ptr))__uaccess_mask_ptr(ptr))
>+static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>+{
>+	unsigned long val = (unsigned long)ptr;
>+
>+	val = (val << 1) >> 1;
>+	return (void __user *)val;

This is only clearing b63 which is what we don't need here.

You should be clearing b47 (if bit indexing starts at 0) on Sv48 and b56
on Sv57 system.

Anything above b47/b56 isn't going to be used anyways in indexing into
page tables and will be ignored if pointer masking is enabled at S.

>+}
>+
> /*
>  * The exception table consists of pairs of addresses: the first is the
>  * address of an instruction that is allowed to fault, and the second is
>@@ -235,7 +252,8 @@ __gu_failed:								\
>  */
> #define __get_user(x, ptr)					\
> ({								\
>-	const __typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>+	const __typeof__(*(ptr)) __user *__gu_ptr =		\
>+		uaccess_mask_ptr(untagged_addr(ptr));		\
> 	long __gu_err = 0;					\
> 	__typeof__(x) __gu_val;					\
> 								\
>@@ -366,7 +384,8 @@ err_label:							\
>  */
> #define __put_user(x, ptr)					\
> ({								\
>-	__typeof__(*(ptr)) __user *__gu_ptr = untagged_addr(ptr); \
>+	__typeof__(*(ptr)) __user *__gu_ptr =			\
>+		uaccess_mask_ptr(untagged_addr(ptr));		\
> 	__typeof__(*__gu_ptr) __val = (x);			\
> 	long __pu_err = 0;					\
> 								\
>@@ -413,13 +432,15 @@ unsigned long __must_check __asm_copy_from_user(void *to,
> static inline unsigned long
> raw_copy_from_user(void *to, const void __user *from, unsigned long n)
> {
>-	return __asm_copy_from_user(to, untagged_addr(from), n);
>+	return __asm_copy_from_user(to,
>+		uaccess_mask_ptr(untagged_addr(from)), n);
> }
>
> static inline unsigned long
> raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> {
>-	return __asm_copy_to_user(untagged_addr(to), from, n);
>+	return __asm_copy_to_user(
>+		uaccess_mask_ptr(untagged_addr(to)), from, n);
> }
>
> extern long strncpy_from_user(char *dest, const char __user *src, long count);
>@@ -434,7 +455,7 @@ unsigned long __must_check clear_user(void __user *to, unsigned long n)
> {
> 	might_fault();
> 	return access_ok(to, n) ?
>-		__clear_user(untagged_addr(to), n) : n;
>+		__clear_user(uaccess_mask_ptr(untagged_addr(to)), n) : n;
> }
>
> #define arch_get_kernel_nofault(dst, src, type, err_label)			\
>@@ -461,20 +482,22 @@ static inline void user_access_restore(unsigned long enabled) { }
>  * the error labels - thus the macro games.
>  */
> #define arch_unsafe_put_user(x, ptr, label)				\
>-	__put_user_nocheck(x, (ptr), label)
>+	__put_user_nocheck(x, uaccess_mask_ptr(ptr), label)
>
> #define arch_unsafe_get_user(x, ptr, label)	do {			\
> 	__inttype(*(ptr)) __gu_val;					\
>-	__get_user_nocheck(__gu_val, (ptr), label);			\
>+	__get_user_nocheck(__gu_val, uaccess_mask_ptr(ptr), label);	\
> 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> } while (0)
>
> #define unsafe_copy_to_user(_dst, _src, _len, label)			\
>-	if (__asm_copy_to_user_sum_enabled(_dst, _src, _len))		\
>+	if (__asm_copy_to_user_sum_enabled(				\
>+		uaccess_mask_ptr(_dst), _src, _len))			\
> 		goto label;
>
> #define unsafe_copy_from_user(_dst, _src, _len, label)			\
>-	if (__asm_copy_from_user_sum_enabled(_dst, _src, _len))		\
>+	if (__asm_copy_from_user_sum_enabled(				\
>+		_dst, uaccess_mask_ptr(_src), _len))			\
> 		goto label;
>
> #else /* CONFIG_MMU */
>-- 
>2.51.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
