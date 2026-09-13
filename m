Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAFBC88E5A
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:References:In-Reply-To:
	Subject:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ir7D2hmaOmY+lXkwsSu2k7oEizblk1jwuF0wgAWw8XQ=; b=IWa4CUA6oOF8iC
	MXd/t65FTkv6Ms+H6BXFq4krmSoLGhua1A8z6xqlbUunYI2rlCnta2m/cmnwREnVy2WGEX+NwSXav
	BPtQcFy8Dg58O5Tbp91KC7QGym7V/IRIIy5oepqW7hoBWVhgftlFqScwFNckP/D4N3u9YAYlzLMBf
	pDYVLMgla/SF44C5jS0Cx8lrb2ifTDmmHgZP5S0TiYjY5S0MPkgPc+8RXD0kZPnleYM+k/w0fnkqj
	ctCSSyjMG/s4Jp6wy+N62m26EhWLSibbqnDH087OR67fYMw8NYOBhscyYvrIu9Fk8eP3slFbvv40o
	Nzm+U0jmwxB0No2X+BSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5j0K-00000001dR8-2tyP;
	Sun, 13 Sep 2026 12:08:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5j0I-00000001dQn-0mfm
	for linux-riscv@lists.infradead.org;
	Sun, 13 Sep 2026 12:08:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU3lO1872274
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=; b=lRNGUjTybCpU8/ls
	t2LZ/yoEe5tS2rXBKnFB08ZrP83cyeUW5gOG1M91fjTq16aWG6nH4SBKV6a0+fgC
	9PzRcKqQS1Jw76cdYX8aoUhIjF/3naOrrCKWiuB72YmY/2EJS8lKfXuGHco8meaq
	QZUzPZYfrmwAizFGEuVAExAaKiN+JJ17v8T+H5XqwxEV0ao9Uh6GdnU2uIemvKI5
	f8vC6BRYRLegF85n6zEFjFBsZ9Rq+AbnuO6dQwKJdIvimvYRWwmour3hAv+1kjsA
	F7NdypkPTclqBWQjQkZtZ8UnKV4nwirkOpjym8FpEk0blUHPr/XD+iG/qVD9y0Zp
	Xst1mg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dk78g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 12:08:11 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a59faf521so3601383b3a.2
        for <linux-riscv@lists.infradead.org>; Sun, 13 Sep 2026 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789301290; x=1789906090; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:cc:references
         :in-reply-to:subject:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=;
        b=J8tF6a/RfDdH6k0QSk4Lw76SRksCwWhvlbti/u/tTVXCF6oItb3w2IxChCzjd61Qoc
         +N8oh2U1x8tWpBYeQ26JguO+oi6fD9VNy/9Qg+yxlSVCz9hkaAc32nola/MhtN6mo8ML
         q67f/n5GVum7LbxsJ9UBUjmNn30RmIOYMGnuI2oJqv2l1vinOGDMvvb3bFfC0Zflu1cu
         j0SpyW17+kHilaYb8Vrh6mT1TcoA5MbAlsKFgNFwrgXOyEr4fxbQVcu1gBKpbZFzcDEE
         /dbT119VCy9t4y1p3abTi3uTZBTV1pTIlCQjUrlEQHKCSdfrmUvaPi+h6iidN3ReRV2T
         ueyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789301290; x=1789906090;
        h=mime-version:content-transfer-encoding:content-type:cc:references
         :in-reply-to:subject:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRKYA9mVvempr/6gm9Uvztlav9Ha/BqjYUGbx8YbOLc=;
        b=AWTVWvcqtBNDHH+h5xwt2RanDi/wIfr3u3WJFQ4vzb+D8PrGtEzbJFvHGmkP/HVhrx
         2UGVXfLgCVTfWLIf0frgGOSJwehlHdKOjvvqY925ASt7N9srPLegwWG1IWMtkHF3+DVL
         IMJ+V6Wz9jIIZg2ui8xLKGvz3vPLTvwvZVP7Xv8t+WhGTJqp3UnsShRsSqmUC7YbiOSO
         Q8AeR7Vl5O6QcP5+ZOQuf+GKNm/kFiAYeealF99XtRdBaVArDXJO28nYBM87AosrMkOF
         I7NoylyaAJMSAOYN386qcluzZATzNy4wvjluuHn2UEEKVynchU6bIAQNtZyrImsjURH1
         /gcQ==
X-Forwarded-Encrypted: i=1; AKwUvByKT0XkQJ18crEE1CU8X17FlXwnyzHVuKodFGcjnub76DL5t66gscQF0JdXGMkK+c0j73OmVagA+N42Zw==@lists.infradead.org
X-Gm-Message-State: AFuF++lXBGsiGPNAoqprMYOE2CkF3RXhoo7wrWZflP8DmNheUnUh3sLY
	i6phQbKB8odaE+yG0KhtHKlYvaMtAAEcE9COA6+XceRtvMnSKvMiZNYHJXUlaN2g9OXvzrFLEWP
	yC/MUPsgEO6LVKT3JdkKjo+P2VDeVNFAgkn1pwGUyRQTpsyw/gBeysAoZwuWpc89jU65m6Rk=
X-Gm-Gg: AYBFou0Kf/3fBpksDemEeIdEXsfYlKtGgfboo9qHog5wZlQLcflPBJ9Orc1kC3AFiub
	tbqNVtlyTTchA+FjGoRkcx7PeMPpeqRQRgdXNINT9ejazsSrmMoHfuBHtvaDflrd1eaRLjhqjWE
	S3FzS93lrSxWpa8ve9/zyzYlevxL+dcpcy42y5zLDB7JzdNKtK2F8ydk9UWde60NBey6LRW3gX3
	XpMfm4B8AvV6WmqH5wMGhsnax425jUGv2tvx5asGd2zkofxjvkn3S/MTcWgLaBUeb5nq/hMDicP
	oGx4z2Np/eRVp5peq+Q+zvpGuYk789i7DC5DDeFOX06D9npuECsDlDLGSg==
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr10858298b3a.20.1789301289860;
        Sun, 13 Sep 2026 05:08:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d01:b0:85c:2d83:bbf1 with SMTP id d2e1a72fcca58-86ccb44e113mr10858220b3a.20.1789301289287;
        Sun, 13 Sep 2026 05:08:09 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b5062c60bsm3183947b3a.22.2026.09.13.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:08:08 -0700 (PDT)
Date: Sun, 13 Sep 2026 08:08:04 -0400
Message-ID: <b811b28d52275928699251b0b064a642.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Andy Chiu <tchiu@tenstorrent.com>
Subject: Re: [PATCH v3 2/3] riscv: hwprobe: export the availability of
 vector to user
In-Reply-To: <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
References: <20260725001614.2578617-3-tchiu@tenstorrent.com>
 <20260813233854.86799-1-mark.hsj@gmail.com> <apGwuxgYZsZHiB8o@Tao-Chiu's-Mac>
Cc: Mark Harris <mark.hsj@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>, bergner@tenstorrent.com,
        kito.cheng@sifive.com, dfustini@oss.tenstorrent.com,
        greentime.hu@sifive.com, Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Xu Lu <luxu.kernel@bytedance.com>,
        Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
        Jingwei Wang <wangjingwei@iscas.ac.cn>,
        Deepak Gupta <debug@rivosinc.com>,
        =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3MiBTYWx0ZWRfX528HMoGrEhe6
 vDtgIzx7phmLQ1j85VWRrkHxy6lF46K196N4CDLwoctFHquFbmeZfXSON+i0X9ZTscED2s7Jbmu
 AY1A+LZTgiP9eraN8J/AV44a1uWyw01jqcegl2fo/9DQHFUukxEVDVLhygjcgbhLZ5y7FqstUM0
 Xtah/xtllOZefFEs6VCEqK/0R71mtIVMx3ET3z5oF20m5+LW4uJmCjnAdAJ5DEsA1irv1bY4oDN
 u5vY5yC+rwwXF1J2F9oFLmwwk5RY1kl/vLBUM0bykIDLDFkJBt9hBrOIvWQ8TPbZxbvgPARHAM9
 tP82Z4dirTvIFP0fJkdPX4k/TR2Fl00kwrUIWNWlWlzJGCzNrJHUUbgjjkiuPlrB6g2OYFGlYtn
 UF8wjfXvSx1TAYq6AQcruI9mx19l0S/uGYx5t3GdgRunrxdYqVk0MIbcbrWGeCw/g3j7LkWdMYe
 BD5CxLGQotbrrm0yghw==
X-Proofpoint-ORIG-GUID: i08m2R71feoWAOHUFx81oRjHl8AWUlrl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3MiBTYWx0ZWRfX6nc3aY6oRgJm
 PRDS1TbC8lq6ytLTbCgOz36YsK+q3kz3a4SzkXz7V0Q8nAA0pIcgK6moR5odjf5c0aD9W1AVOtX
 Ysvz0In9s3Gyjix+FiK+A2Izf8q9b0I=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa6922b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=qudAywcBR2F4KdnsAu4A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: i08m2R71feoWAOHUFx81oRjHl8AWUlrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_050814_371769_69AE6A4E 
X-CRM114-Status: GOOD (  35.99  )
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

Hi Andy,

On Fri, 28 Aug 2026 11:00:59 -0500, Andy Chiu wrote:
> On Thu, Aug 13, 2026 at 04:38:54PM -0700, Mark Harris wrote:
>> > Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
>> > no value of its own. Within a single request, keys placed after it report
>> > extensions that are both present and enabled for the calling process,
>> > while keys before it keep reporting hardware presence. This masks out V
>> > and its V-dependent sub-extensions when V is disabled for the process, and
>> > lets userland obtain both views in one query:
>> >
>> >       [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
>> >           present       modifier       enabled
> >
> > [...]
> >
>> indicate that existing keys should be reinterpreted in a new manner.
>> Using a key as a modifier with no value and changing the keys to
>> be order-dependent seems like an unnecessarily confusing ugly hack
>> that we would have to live with for decades to come, just to slightly
>> simplify code needed in the short term to handle older kernels.
>
> [...]
>
>> Because ifunc resolvers may not have access to external symbols
>> beyond __riscv_hwprobe(), it is really attractive to be able to
>> obtain extension availability information using the same function.
>> But that doesn't mean that the kernel has to be involved.  The
>> function is in libc, so it could call the vDSO function and then
>> optionally modify the resulting values according to its own
>> process-specific information about enabled or disabled extensions.
>> This extra information would ideally come from the initial hwcaps

It already does, and I can be more definite than "ideally" here.
ld.so invokes every ifunc resolver through elf_ifunc_invoke(), which
calls the resolver as resolver(GLRO(dl_hwcap), __riscv_hwprobe, NULL);
dl_hwcap is AT_HWCAP from the auxv, which is ELF_HWCAP from the kernel
riscv_get_elf_hwcap() who already considers the prctl V ON or OFF.

glibc's RISC-V memcpy resolver receives that argument today and ignores
it, keying only on hwprobe IMA_EXT_0. So the glibc-side fix is to consult
the dl_hwcap argument the resolver is already handed: no new kernel
interface needed.

Refer to glibc.git, sysdeps/unix/sysv/linux/riscv/multiarch/memcpy.c
  select_memcpy_ifunc (uint64_t dl_hwcap, __riscv_hwprobe_t hwprobe_func)

PS: I briefly verified this solution can work using QEMU.

> Unfortunately, I think the riscv community has decided to stop using
> hwcap and move forward with hwprobe. Although I agree with you that it

If you can clarify what 'stop using hwcap' means, that could help a lot.
The policy I know of is that new multi-letter extensions are exported
through hwprobe only, and the policy doesn't say user space stop reading
hwcap bits.

From what I can see, hwcap is still in use, and with new single-letter
extensions being ratified, hwcap is being extended as well. Like 'B'.
Andrew stated the policy on his RFC: "If RISC-V defines a single letter
extension, such as V or B, then we should add it to hwcap" [1].

It's true that ELF_HWCAP only carries the single-letter extensions,
and multi-letter extensions go to hwprobe. But here we are talking about
'V'.

> is a convenient way to add such per-process's extension enablement
> status.

For V in particular, AT_HWCAP is already the per-process view. Your
own commit 50724efcb370 ("riscv: hwcap: change ELF_HWCAP to a
function") clears COMPAT_HWCAP_ISA_V whenever the prctl state is not
ON, and Documentation/arch/riscv/vector.rst still tells ELF programs
to read that bit to learn whether they may use V.

>> (which reflect the vector prctl) and any tunables, so it is
>> process-wide, can support arbitrary extensions, and can be checked
>> without any kernel syscalls and without callers having to know or
>> care whether a particular extension can be disabled.  If the prctl
>> was used to re-enable vector in some thread that may not affect it,
>> but that seems like the desired behavior, at least for ifunc
>> resolvers, since they are assumed to produce the same result in any
>> thread and at any point during the process lifetime.
>
> [...]
>
> I think the argument comes down to: do we expect the mismatch between
> an extension's availability and existence to grow? Using the same set of
> keys sounds like a good idea if we expect more extensions comes with
> per-process enablement status. On the other hand, if future extension
> supports come without the ability to turn it off, then this
> implementation may be an overshoot.

My position is with Mark: a positional modifier key is the wrong
shape for hwprobe, and I don't think the kernel needs to change for
this. For V, the per-process answer is already in AT_HWCAP, and
glibc's resolvers should use the hwcap argument they receive.

If a second extension with per-process enablement ever appears, that
is the time to pick a hwprobe flag or an independent bit, as Palmer
suggested. Or a solution based on glibc tunable as Mark mentioned.

[1] https://lore.kernel.org/all/wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t/

BR,
Guodong Xu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
