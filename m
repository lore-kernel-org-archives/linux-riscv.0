Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DA606A329
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Io1issyy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nFscZflr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c0GDsRXX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YGIHe8nZnTyTnGdTCe5TgNgmmNmqeTLzji/g2chWX00=; b=Io1issyys9uwTCcV2CzcVq0J42
	DbLvxnzTGXEXYUs4FQnbYuUVwTq1vehW1+5eOSbPJmxaPy71AOlHrlDSWOR3tB1D2Cvz5RUBCVTqk
	jnixVU+pTed0TljkI1sYXRGC0+iTprELkNe/2Y+qw6frxlDjwC0Ht9/7MiF5hCXKrLzJs5ES6uphc
	eIssAcAbsRiKumDOK9yO9fbhOG3xdiNP417GlWA4VsIuXULTQBI9jqOu/2HYyM/uSdO4odeuIHYpY
	o3PqlQrx4gpwvkUOWPueGvyZwJeZ6Pa+aN2+Kh65EW3QL1xDm/SU9XMK23DM8Afvpc0MLwhJ7ONzf
	P7Ee/qtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIA9-0000000GZvf-1AEX;
	Sat, 14 Nov 2026 18:07:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSIA6-0000000GZuj-3pu6
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 18:07:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHpmpa3021486
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=; b=nFscZflrGPMCkiYW
	Lh+FAKQWMtpwvD4f0ymyjp5MatH6wZhJzl9zC0VfBlb4CLznKNOXqhGTp0cMkBxN
	Yqs2/ulE399Oy3nXDjqwMT5axIBzjHs1bR9RAL+R3TQxkxmzK0dXVlhP5d5t9lUe
	/5HVl+RYXsgMtNjSWPnDnk1yXl/L4TTyA89eKTO7oaMtBO1MEWsiyM5tmFtflv0E
	/yauIV2jWtd/8/QUtFfolRf3+rsRbvl0V8t5j+blh3K6DujjXv9jH4JbFZa3pk7V
	tiK328guRyflMlP4eUaNCaivD8RpE2DnUAtSIN8wyG4zOA1ZJ4EmNBaob9gjGvHZ
	Wv+A2A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmc9bws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 18:07:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2500081c88.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794679657; x=1795284457; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=;
        b=c0GDsRXXTNH07qXNDdzBf8+3GISU8Iwtiz16iWEfihd/0EoGhvkNY83AGun/ywl0sN
         2yKSs2kUCKVWSPxzHu7mIny8PFi3or0x//7az6NPlg+HyBlHhdnqLY8/74Y1z87LHKYL
         1iZJSrmfMf1Vcr21rmQ117FzQz+ie6TMX/E4nXzUHDVGJYXxenDyF4SFS2ohKtO7k/UH
         n8a4UTIPmjZBK16z0rHLyGHQXr+3AM+PptxRsxn7uWqyk0dRlqoHp0+70UFduRyTnxWM
         xcs2yU8qXWQOk4gPsYcNXavEI+Kcn/L5VeCbmlb5MyoSM0Xrr7jTaMY+Yc0EMVyMP1Ax
         ZJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679657; x=1795284457;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=;
        b=kPLXp3iCzOkcOomH+xy3A4nFaY4BKj9CtN5bH/HthjUEr9fIVq74GfwhysQNzZD02z
         7nU7iy9PrYK2NFInW4sss857//gAP7LrQbkF54Y1hTgQbbskw/35VAdGp6om0s3c4x9S
         ur9cA5C1knKbMw2wACtq9Mup1QlN1vXDmwo3MemoJXDTe6ECfuqQD1IYWJf4pQkUCken
         i/fGtsfkdiHsOoff88wCgqj4/YY2x0Q/96GwiOMPg2yKLIKknxO20/PqDa923YzQ2Cku
         3+qU6pQTTJha9oB/lkxepCcY0LRoEAYQDIPxIOs0tTcDXuE7NHeFPcM0xSDy1Tc+1HNB
         nAZA==
X-Forwarded-Encrypted: i=1; AL+hErF0ST+5p0kEn/5Z4EMvjaOxc//72GCdCHXtQwoS8vGtBp22QOlkxa0fFFFVBYSLXPkd0RBSc9ySWmBMZQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9jMauBNOBojYe4U0kZ7SH5McE9SwlPpf9dxtZIHgoQWABcAHiT
	pAKJK0eyjZToDYLHIGbrA9jHO/TDsaHJkFgMcWt6ZVvhC92Fjr0mRndmh0VTTPq2s65L8URIEjL
	bOxDacMIB8+cbiRq45d4P9++UqhFJkc4Szx1vqt8rXedlVz4R+pqL2EgPqK7sJuyJItaLW/E=
X-Gm-Gg: AYBFou01W8VCf+cmCTNKjzYj/hxtESNuLnyhy1+rsUohp1qyhlpc6c1SiNp89DP5sCy
	7/rEOZgod/gqiSULaOvPdM46mI7G9zgmRiAkfyS4qVE/+sdIkB5LWZiaC34lHWgKt9mikDfoqx0
	gZRYYF291stRyVKtrzwgDsqlM5GGH4odjL8liocLJCE9mvs4NL7Trp3pIgLF2Ca80lOHf+QgB/2
	uFnQc2iCPRNiP7Cs13wmJeg8k55mz3kG/Q27rdkXdghGIySKW2Z/5mPzgPDS4gOKWVrS6B3+q0D
	gEmlm+8Udhz3iv7SYmGHUx7l1ZeLtVaQ1L8zzcaOxj4+6+llN1sx7stQWrTxDfN3+3xkZkoQdYf
	b8Sb/9zgGHbZzukcaKBeJ3xu2b0w7/MlxZz/4JPufdISiOWIDtVD1yQ==
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id a92af1059eb24-1b5030bb5a3mr5117170c88.25.1794679656897;
        Sat, 14 Nov 2026 10:07:36 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id a92af1059eb24-1b5030bb5a3mr5117132c88.25.1794679656105;
        Sat, 14 Nov 2026 10:07:36 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm24690685c88.9.2026.11.14.10.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:07:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Sun, 15 Nov 2026 02:07:27 +0800
Message-Id: <DMV4U82NLDBL.2LTGJAM719DGM@oss.qualcomm.com>
Cc: "Song Shuai" <songshuaishuai@tinylab.org>,
        =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
        "Han Gao"
 <gaohan@iscas.ac.cn>, "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Mike
 Rapoport" <rppt@kernel.org>,
        "Baoquan He" <baoquan.he@linux.dev>, "Guo Ren"
 <guoren@kernel.org>,
        <kexec@lists.infradead.org>, "Cong Wang"
 <cwang@multikernel.io>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: kexec_file: Keep segments out of the new
 kernel's PMD padding
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Cong Wang" <xiyou.wangcong@gmail.com>, <linux-kernel@vger.kernel.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261114034901.107028-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20261114034901.107028-1-xiyou.wangcong@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MiBTYWx0ZWRfXy81c5+9HVgVQ
 V9BjYREjLxpXzTAyQ925nxLySBv9FIj5hoX+7YHRWoVw2ePXmkf+H8p1ERkTHNu5AvB7+zGUSQb
 2f7SRE8eajea6FIkDDDGRG8avxbxdJQ=
X-Proofpoint-ORIG-GUID: XjkQycFIQo3lo2TXmccj0PqDidVAF7Qo
X-Proofpoint-GUID: XjkQycFIQo3lo2TXmccj0PqDidVAF7Qo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MiBTYWx0ZWRfX2gbPfhN/VLco
 KRzmNDUikAjZg0jahysZABiKtfY315KlZDtlshwg0kRUpMvU1Fb3wurZbEHUka3DSkaSD8g0SE8
 FoP8wQom6mqZAp23D3vi8YCqLWatBFF16UCRQ/0ByYZK+AzJ6hmlLz3+YZD+QSErjJhNBbjE1rr
 HIC1BrrT8sUhNSX8BBZh+/1nXs4YzGJrRlOCRGA7Ps1EL3S3Qhk8u58uM26q4gK9Ns5bfU4sID/
 cqxiXptrgE0FoVFPJrK8EEFhNIDT7M4dkCpkUV3NDcNIDG/sLfiUTQ7yBg4IKxEZPGTIIdk9kxk
 x8/bz4+wG0KZT0LjzcPnip3/L3rMiNa6sD6hhYx5ZOWxMJcaYXz/f6o4uUdD9Cyi7VoAUCJq3F+
 EbmcOxeGcGguIkiXJ5jZLzcCOsT2TC80+3d7PECTHFDGwTbO27ybDYszo5adTHSQP35ITTt58n5
 tBqUy0jv4SXdYK8/V/Q==
X-Authority-Analysis: v=2.4 cv=Vpy2kO2n c=1 sm=1 tr=0 ts=6af8a369 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IMt4O7P0LTl0bQ2OADMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_100738_968116_B36A92FE 
X-CRM114-Status: GOOD (  26.77  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat Nov 14, 2026 at 11:49 AM CST, Cong Wang wrote:
> From: Cong Wang <cwang@multikernel.io>
>
> A 64-bit kernel with STRICT_KERNEL_RWX reserves itself up to the next
> PMD boundary past _end in setup_bootmem(). load_extra_segments() only
> keeps the other segments above kernel_start + kernel_len, which is the
> unaligned _end of the new kernel, so they may be placed in that padding.
>
> The segments are placed top-down, which normally keeps them far from
> the kernel. A kdump kernel's segments are confined to the crashkernel
> region though, and when it has little room to spare, the lowest of
> them, the initrd and the device tree, end up in the padding. The kdump
> kernel then finds its initrd in memory it reserved for itself, drops
> it, and panics without a root file system:
>
>   crashkernel reserved: 0x000000017be00000 - 0x000000017fe00000 (64 MB)
>   Loaded kernel at 0x17be00000 bufsz=0x1c40600 memsz=0x1cb1000
>   Loaded initrd at 0x17db58000
>   ...
>   Starting crashdump kernel...
>   INITRD: 0x17db58000+0x022a4000 overlaps in-use memory region
>   ...
>   Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>
> The load itself succeeds, so this only shows once the system crashes.
>
> The kernel being loaded may be any version or configuration that
> reserves the padding, so the loader has to keep clear of it. Start the
> other segments at the next PMD boundary. A crashkernel region too small
> for them now fails the load with -EADDRNOTAVAIL, and one with enough
> room boots the kdump kernel with its initrd.
>
> This was found while testing multikernel, which loads a kernel with
> kexec_file and hits the same overlap.

This catches insufficient space at load time rather than accepting a
layout that overlaps the target kernel's PMD padding and fails at boot.

Tested on an OrangePi RV2 (SpacemiT K1), using zero-padded initrds to
exercise the following cases:

1. With sufficient space, the patched loader boots the capture kernel
   and runs its initramfs /init.
2. Without the patch, a tight crash reservation accepts an unsafe
   layout; the capture kernel reports the initrd overlap and panics.
3. With the patch, the same tight configuration fails at load time
   with EADDRNOTAVAIL.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>
Reviewed-by: Ze Huang <ze.huang@oss.qualcomm.com>

>
> Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary file")
> Signed-off-by: Cong Wang <cwang@multikernel.io>
> ---
>  arch/riscv/kernel/machine_kexec_file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index 26cd2a8bd0cd..0d2d43a7dbfa 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -251,7 +251,8 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
>  	char *modified_cmdline = NULL;
>  
>  	kbuf.image = image;
> -	kbuf.buf_min = kernel_start + kernel_len;
> +	/* The new kernel reserves itself up to the next PMD boundary */
> +	kbuf.buf_min = ALIGN(kernel_start + kernel_len, PMD_SIZE);
>  	kbuf.buf_max = PFN_PHYS(max_low_pfn);
>  
>  #ifdef CONFIG_CRASH_DUMP



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
