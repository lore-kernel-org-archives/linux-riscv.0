Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DFBC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBdDW5FVoHst9zQ2Pn8VnIqUzRdS0Dqw6EhA4Zv+sMg=; b=x7LG05SeEmqSs9
	yT6Snr6dFIjotiewtDU9J6iwq+kYjYzmiFopjrtECctt+Id/s+pPAggMidD8RKeZTIhyzDFasGrqk
	vgsLpxD/FdvM2zW/pCdUEZQ0Jy0bo5j7nyddSxOykLr3F83zqlLbNXtLMBQ5/dFuVEFCuytWN2nrG
	RiC9S20sgw9hX839niwGtFahI0IW9eUlQDhKE8MSk0QU6gMHjqDb8lfamHJIDzrnpNT3fvHJvUAuq
	7ob0UZfjEkCRUIDHaLJmfSUQAepR0JtDdV9kmUrMCL+zbJBl7s1Fw2aY5Hoh9KwPA0C1xAC8+vzMv
	oFtYxLhcsXLN/IM6f9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8EM-0000000HPmO-2SoJ;
	Fri, 29 Mar 2024 09:08:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8EI-0000000HPlj-00H7
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:08:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-414a2679222so10886385e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 02:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711703330; x=1712308130; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vSvU75eALFtAgVLgzybRJGQPZckpP1X2THROU/cjxkI=;
        b=NNWK3FIvQY1Vzr4b0p3k3MibKVSKS+rjMi1UsX+sucEemoMYI+NqkQpvVduvkHDgoV
         ooPNpUYK5U4UIpYNfOdwSzANp6ToHcMC0a1GO6cR6AQ5laemaixQnQRAt6moU99IhcGm
         hTh4DDldmin8g5hNSz2nFXfhwcvQYXJ80bMOfHjFoHFjzy2kGqwM0VYZ1s5qmi0xnhzP
         F2hpzZjRRDr3wLFonLLidb0Q5/EpVhV14EF8ynwTwtGG94GFGlOYB0adsM8PRSWx8psA
         L2WT4OOljcqyBiDmAZgCeNa9T12gcTgDD7ymwcJU/a5hathXthUchiVUyD1KfKfSFtBO
         207g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711703330; x=1712308130;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSvU75eALFtAgVLgzybRJGQPZckpP1X2THROU/cjxkI=;
        b=cikJD1t6TbEZbJ8AP6b/3PamLaW9FJayClD/3k6fp7Vhy6SihDjcUv2tYfLpnFggLx
         r4QLONn/2sj4J9PMVpXx4Pcx1Ib1M/WXFPl85a5l7fO4rcEPpjy3jV50xdQK4X3J/2hg
         kFGNyb+Nq4RVptrPg6YTVSIGoon/1IfXAdBUyM1PrWNSN5YxkdNP+jh4LgvvhCck0M9b
         +9KE09xdar994bGrQ37ja7sBKpGFwGqhj9fg7Jzlv0vmOSSE55ixm/ni7iGQ3QnqODq9
         JmLXinVuxCJ/UzyR3fRzUBRJR4RwVNYsWwa10kpkVZoSMD+E4acMVicmHd7g/UhtIXTX
         1EpA==
X-Forwarded-Encrypted: i=1; AJvYcCX3wFSf3ot/7DjNvFKrLHk34OXCrPj4Vp09RIk1W27Ah/sO/pVwLvF+5OJ11ocCVd6vkLxa0gaLh0vpv+YDR7pLdSk0QWYsBArapesfgeR6
X-Gm-Message-State: AOJu0YxF781V9hfHWOeKHZcxM+EHR7ts7BMnmbI41Uect+fFdh790rh3
	m8WE5D01VNQnKOP12TX9s1nBMrWM6JRdy1f84/FyUNf5VrKiK1kk
X-Google-Smtp-Source: AGHT+IFORsJ9E85QUnpfs36KzvJbwTYnnVDgnGqwgKOb5Hip9huHXYYlaEja87LGOTGnC5lLLgX+aA==
X-Received: by 2002:a05:600c:a0b:b0:414:60fe:8f2b with SMTP id z11-20020a05600c0a0b00b0041460fe8f2bmr1369503wmp.18.1711703330115;
        Fri, 29 Mar 2024 02:08:50 -0700 (PDT)
Received: from ?IPv6:2a00:1858:1027:8084:dcff:fef3:4040:e18d? ([2a00:1858:1027:8084:dcff:fef3:4040:e18d])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b0041551590becsm664022wms.4.2024.03.29.02.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:08:49 -0700 (PDT)
Message-ID: <32b3358903bf8ba408812a2636f39a275493eb91.camel@gmail.com>
Subject: Re: [PATCH bpf-next 0/5] Support local vmtest for riscv64
From: Eduard Zingerman <eddyz87@gmail.com>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Mykola Lysenko <mykolal@fb.com>, Manu Bretelle
 <chantr4@gmail.com>, Pu Lehui <pulehui@huawei.com>
Date: Fri, 29 Mar 2024 11:08:27 +0200
In-Reply-To: <20240328124916.293173-1-pulehui@huaweicloud.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
Autocrypt: addr=eddyz87@gmail.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_020854_194198_AF9AA8A1 
X-CRM114-Status: GOOD (  15.41  )
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

On Thu, 2024-03-28 at 12:49 +0000, Pu Lehui wrote:
> Patch 1 is to enable cross platform testing for local vmtest. The
> remaining patch adds local vmtest support for riscv64. It relies on
> commit [0] [1] for better regression.
> 
> We can now perform cross platform testing for riscv64 bpf using the
> following command:
> 
> PLATFORM=riscv64 CROSS_COMPILE=riscv64-linux-gnu- \
>     tools/testing/selftests/bpf/vmtest.sh -- \
>         ./test_progs -d \
>             \"$(cat tools/testing/selftests/bpf/DENYLIST.riscv64 \
>                 | cut -d'#' -f1 \
>                 | sed -e 's/^[[:space:]]*//' \
>                       -e 's/[[:space:]]*$//' \
>                 | tr -s '\n' ','\
>             )\"
> 
> The test platform is x86_64 architecture, and the versions of relevant
> components are as follows:
>     QEMU: 8.2.0
>     CLANG: 17.0.6 (align to BPF CI)
>     OpenSBI: 1.3.1 (default by QEMU)
>     ROOTFS: ubuntu jammy (generated by [2])
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?id=ea6873118493 [0]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=443574b033876c85 [1]
> Link: https://github.com/libbpf/ci/blob/main/rootfs/mkrootfs_debian.sh [2]

Hello,

I wanted to do a test run for this patch-set but did not figure out
how to build rootfs for riscv64 system.

I modified mkrootfs_debian.sh as below, but build command fails:

$ ./rootfs/mkrootfs_debian.sh -d jammy -a riscv64 -m http://de.archive.ubuntu.com/ubuntu
...
E: Couldn't download http://de.archive.ubuntu.com/ubuntu/dists/jammy/main/binary-riscv64/Packages

Apparently jammy does not have binaries built for riscv64, or I'm failing to find correct mirror.
Could you please provide some instructions on how to prepare rootfs?

Thanks,
Eduard

--

diff --git a/rootfs/mkrootfs_debian.sh b/rootfs/mkrootfs_debian.sh
index dfe957e..1d5b769 100755
--- a/rootfs/mkrootfs_debian.sh
+++ b/rootfs/mkrootfs_debian.sh
@@ -16,6 +16,7 @@ CPUTABLE="${CPUTABLE:-/usr/share/dpkg/cputable}"
 
 deb_arch=$(dpkg --print-architecture)
 distro="bullseye"
+mirror=""
 
 function usage() {
     echo "Usage: $0 [-a | --arch architecture] [-h | --help]
@@ -25,6 +26,7 @@ By default build an image for the architecture of the host running the script.
 
     -a | --arch:    architecture to build the image for. Default (${deb_arch})
     -d | --distro:  distribution to build. Default (${distro})
+    -m | --mirror:  mirror for distribution to build. Default (${mirror})
 "
 }
 
@@ -44,7 +46,7 @@ function qemu_static() {
     # Given a Debian architecture find the location of the matching
     # qemu-${gnu_arch}-static binary.
     gnu_arch=$(debian_to_gnu "${1}")
-    echo "qemu-${gnu_arch}-static"
+    echo "qemu-${gnu_arch}"
 }
 
 function check_requirements() {
@@ -95,7 +97,7 @@ function check_requirements() {
     fi
 }
 
-TEMP=$(getopt  -l "arch:,distro:,help" -o "a:d:h" -- "$@")
+TEMP=$(getopt  -l "arch:,distro:,mirror:,help" -o "a:d:m:h" -- "$@")
 if [ $? -ne 0 ]; then
     usage
 fi
@@ -113,6 +115,10 @@ while true; do
             distro="$2"
             shift 2
             ;;
+        --mirror | -m)
+            mirror="$2"
+            shift 2
+            ;;
         --help | -h)
             usage
             exit
@@ -162,7 +168,8 @@ debootstrap --include="$packages" \
     --arch="${deb_arch}" \
     "$@" \
     "${distro}" \
-    "$root"
+    "$root" \
+    "${mirror}"
 
 qemu=$(which $(qemu_static ${deb_arch}))
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
