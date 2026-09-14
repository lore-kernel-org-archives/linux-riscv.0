Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22AAC88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 03:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWBJ2j4tNvGH3ATuMX0e28qFzLWH59eokY8Ahb6deNI=; b=Qjn3COQNc8L8AJ
	aUnDx9X+fWz23Mjx2//99Ycf1Kd4BLXqRl2I7rlZMwDXPGI+A8jd1k6QzszFAKSNPH4jtCW7JU3aM
	dVmzxjMTw6zYUCD5IF1FULQVesWtynYK9S1aBd6BOzYZd6Jn84+VhvN9+ZywnMUTReDAvz5vM+y8Q
	VrSPYDm2uni/Z7ja96fI8AjJWy5ewoSZVextXgeqKuiJ3xxkGE9EB5UBSSr8CE9tzEoK/jVtBEfkA
	2573XdWtZSkfvrIHE86yQjWOxXRZANwGj4QgAeiZctrj+WIAAXjVcRuUbgC2HUXa6tpeOcKfkgFfE
	nysG7nclzJGvQmjSdVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xUZ-00000002HHc-0Y1b;
	Mon, 14 Sep 2026 03:36:27 +0000
Received: from mail-pz2-f43.google.com ([74.125.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xUU-00000002HGy-3e9l
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 03:36:24 +0000
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c5so1458684b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 20:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789356981; cv=none;
        d=google.com; s=arc-20260327;
        b=fpR/XoYKrBED6QuRFE7onKDvZqeeVDwARYlMt4jHRpQYESi+0JUeX91md1IvFqiPxm
         FWWeKywQBaicuCyfydGo9ez5YDZZN6BvU+J2+g3idYXJsr9sJcJrWjUIGMOjvu4/suo3
         EWGiepjtDLzeTRARVvAGXFWjQd0ED9lpUej1Nkh2atU/gjZWSVDGA6KH0QOjVFkPeHmz
         sKcw46cCpy333CxdvCMkt9pHspei+qD7bhasyhdV321Kp6C6aC30d6niqI+ndO+LDEOW
         3+mlwBQm8R5DOpgtMKtQxpeYplO3mTOiUOTs1TBgnaxnlrCv+qsDWuSbyzwY4LMh7aod
         bA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=lrOlBTsBy6V2c/KtLotGt9eMOXZDQ5WGDkpgU93EhdM=;
        fh=9kF778L9gHBp5Tupbrizr/gEwYw2v2ejXwt0vTPHNOo=;
        b=l4t28UO4Lk1q3tjAIkN/H83+IzqdiwfwzDWMsHm+Xvm4VrmES/FrQhkzeJs4FKSID5
         Hd0pixBsKdkNnoAMFX82PZvb4IyqaYAxMiD4YyaylXgbbBGNiZdoWVEp5q2T+qSBEvZO
         CTqAs68PTPGzh96DD5LX8vucViMRMMNPI/zls6ohIQcmfDl7y6f9gutAmIB1TwNmgq4x
         HsRp+l13s2g6VXlLR/7+sLnE/5Isi7gp1GwxwWaHO+2vjxFlhb/MjtrDfwtG7LmNdD7J
         sHrnkqb9suYMHll3i1OhW+jGHs7HfwzycbMBF/do1jS2a8jOdDa9xEAHbEuOxWPshU+0
         QgZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789356981; x=1789961781;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lrOlBTsBy6V2c/KtLotGt9eMOXZDQ5WGDkpgU93EhdM=;
        b=FHxxnaKm0T7fSOSu8FlopvQjKE9B37ipDHivyhHila4nMfyGYRCrZyoPvBERpkXgiG
         RJwnTg5Ini0wL+QSOE9FYPO+jHDWZ5d86w50WgvEB5CUuv0QA3u904bmX+ypWiYryluo
         iNMRoora+edgxQuaCnG220FJvuwu0b/E/50pkmOXCJKk21H1tuXm9KQrY6d7Y1kIxlwz
         ASCW/WhUVJc+v4AS9aFEW34XzJz/ZjhLkbCigzH45hghsspfRltrHwerTUIcFB8+4zqe
         iq9xQHUd3amYNbXbnvCSjb2GaVzE8M9WBMrCufA9JHQg/0qBzQfZ0boFz7O0y96hucLw
         uxQA==
X-Forwarded-Encrypted: i=1; AKwUvBzYHZ4Tk0UwotQ7joB1YR3sDCffa3dUMz1BnYgHX1ASY6mR+xdw7+XYpeCNaicvpd86MfGIgElBoHZqxA==@lists.infradead.org
X-Gm-Message-State: AFuF++nVaIiJltbMmx8pjw8T3Ei2wOrKb6r7S5Bj7DevfZIb09b6fROM
	izJ41pCGtjtwc0cvsw2IlGBiGhbPVWvAxgNPku70kfbqAFOBF4KIwk1M/9Ns7ZeoKAGf741vVuA
	PbwpUmUWR5MQTi48oveTZJ5wwFU2mUt8=
X-Gm-Gg: AYBFou3NwubSHdzR9jgMPguN46173Xkt6tHWCZbVwa1AqSQ4Ayccmi2FaPEw5M2JkTh
	gDAFiUV2ZHAX4NbrwaCzKa28XdwQTsP4IJtGJ+0z3UN49V40zrxcQS2EJLKjGn16C8mE7j5Tw1V
	xvgfwWrjmlPc7w0jRy8oZfJS86yfBeoW0OBwEOn0vTrqhlKZ4IticCxq269nQ8/owHMGk3j6V0v
	KON0pblSfFIC+2WMhtvyFCFR12QFKGyRA4bLb4P59p90qANcz1C/iuL0hfAIeZP4e13cog/aJf5
	pfUAy8AfBSe3quZktho4eNp6bh9Ymi7CXP2J399sG59hasDXur0vACc=
X-Received: by 2002:a05:6a00:6017:b0:868:9662:5137 with SMTP id
 d2e1a72fcca58-86f8394024fmr1998067b3a.11.1789356981117; Sun, 13 Sep 2026
 20:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
From: Michael Neuling <mikey@neuling.org>
Date: Mon, 14 Sep 2026 13:36:08 +1000
X-Gm-Features: AcwNN1X9lJnTm0DPIb5MBEAosgvXhCjDs0HstYSNYdtIGTJiXdup_FJi7fswjtQ
Message-ID: <CAEjGV6zvz6h-2qWDFJ5kUr0y6CBFK6Rr4NCaJnDnNPN_mLymiw@mail.gmail.com>
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
To: shao.mingyin@zte.com.cn
Cc: pjw@kernel.org, jiangfeng@kylinos.cn, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_203622_920697_44CB2FD5 
X-CRM114-Status: GOOD (  20.11  )
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

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count
> boundary") computes the aligned scan boundary from the last valid byte
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the aligned boundary lands before s.
> The pre-loop guard "bgeu t0, t4, 2f" then always exits for aligned
> strings of 8 or more characters, and strnlen() returns 8 instead of
> the real length.
>
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
>
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  Normal counts
> are unaffected.

Nice catch

> Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")

I believe this issue also affects original strnlen implementation, so
this should actually be:
  Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
The text in the commit needs to be fixed also.

> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Other than the above:
Acked-By: Michael Neuling <mikey@neuling.org>

> ---
>  arch/riscv/lib/strnlen.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..2451289ed0f9 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -87,9 +87,19 @@ strnlen_zbb:
>          * Aligned boundary.  Use the address of the last valid byte
>          * (s + count - 1) to avoid loading a word past the count
>          * boundary in the loop below.  count == 0 is handled above.
> +        *
> +        * Saturate the boundary when s + count wraps around (very large
> +        * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
> +        * destination whose size is unknown at compile time).  Without
> +        * this, the wrapped boundary lands before s and the pre-loop
> +        * guard below always exits, returning a truncated length.
> +        * Saturating makes the scan equivalent to strlen().
>          */
>         add     t4, a0, a1
>         addi    t4, t4, -1
> +       bgeu    t4, a0, 1f
> +       li      t4, -1
> +1:
>         andi    t4, t4, -SZREG
>
>         /* Get the first word.  */
> --
> 2.27.0
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
