Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FECD1284
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Mar 2024 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4YZe+subT7walJeVZiy7qg+lpvAlDciHqfUREONw50=; b=zIHloP4Kt122Kq
	O2W2TsltVIkiT/LIW8QaZsDrivaTZ6hgczvQJ0eVhp1mDN5nNTjZwb0YO9h2AEE1NxIeLF0rLAYV1
	oWLyaHLv2Vh6wx6XONlOGe2YwggTbtCDYFAbquV1GInLEKadaXXv858SwPlveCljanpqbD4zSyCVX
	++p9BjjQ4e+Q1bzcGi/71dZ4VPYGXhqY59fnk/f5eJ0Vzd3LJVbq4gLALJWdiJwVKvhP4XtWEBj4I
	M0GepGfMCeGcfu98riD6t7N0/EUyGpcJV9RNpIf3UAtbews0ym3n0wfaANUSbExVNdBVCARdjXdFm
	tuXjIhNW7O1d0gjS3cNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyH5-00000005o31-2kFo;
	Sun, 31 Mar 2024 16:43:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyH0-00000005o0A-23yr
	for linux-riscv@bombadil.infradead.org;
	Sun, 31 Mar 2024 16:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:List-Unsubscribe:
	List-Subscribe:List-Id:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description; bh=0Rl0HfX2VyyvFwoJ3DjRnsEmfM+PnVty8o3+yoDgSw0=; b=JXRtW
	9M6RENWOlPBE2JpAgXgaZgz2PNl/XCL5kGxofHMru4043uQfa6IBHF1C9+tXWps1HCQIuJodi3RgD
	zFBZOvXHhCJI18qSPYeXlNre1++WnMB3qnRd1+/qN5wEoM3c7X5Pvdbc2rU/+1BNDJUV2nc+7sNRL
	de2udnV7Lk0DE0F+myAfSNgql74YqXJpEK4ZGj+EjVYE2pkuFv7+Dv0ZexEy5ls6BrgCUZY44bK8x
	6Vh9iz8jyuBvir06AlAg3b1oM4SwyOaZYDt6jGLt4G+riZVry+1Th6pOAiKc2UEPTLXOw3RlMtIyj
	JjemoIm0rcZERL7YFbGQRjGWPchVQ==;
Received: from a.mx.secunet.com ([62.96.220.36])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyGw-00000002dry-3zp2
	for linux-riscv@lists.infradead.org;
	Sun, 31 Mar 2024 16:43:09 +0000
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 6C28720184;
	Sun, 31 Mar 2024 18:43:06 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pjo1MgY72iUk; Sun, 31 Mar 2024 18:43:04 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 7593420847;
	Sun, 31 Mar 2024 18:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 7593420847
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id 665BA80005E;
	Sun, 31 Mar 2024 18:43:04 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:43:04 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:22 +0000
X-sender: <netdev+bounces-83499-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com>
 ORCPT=rfc822;peter.schumann@secunet.com NOTIFY=NEVER;
 X-ExtendedProps=BQAVABYAAgAAAAUAFAARAJ05ab4WgQhHsqdZ7WUjHykPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGAAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249UGV0ZXIgU2NodW1hbm41ZTcFAAsAFwC+AAAAQ5IZ35DtBUiRVnd98bETxENOPURCNCxDTj1EYXRhYmFzZXMsQ049RXhjaGFuZ2UgQWRtaW5pc3RyYXRpdmUgR3JvdXAgKEZZRElCT0hGMjNTUERMVCksQ049QWRtaW5pc3RyYXRpdmUgR3JvdXBzLENOPXNlY3VuZXQsQ049TWljcm9zb2Z0IEV4Y2hhbmdlLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUADgARAC7JU/le071Fhs0mWv1VtVsFAB0ADwAMAAAAbWJ4LWVzc2VuLTAxBQA8AAIAAA8ANgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5EaXNwbGF5TmFtZQ8ADwAAAFNjaHVtYW5uLCBQZXRlcgUADAACAAAFAGwAAgAABQBYABcASAAAAJ05ab4WgQhHsqdZ7WUjHylDTj1TY2h1bWFubiBQZXRlcixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc
	2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAU4mmlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGgAAAHBldGVyLnNjaHVtYW5uQHNlY3VuZXQuY29tBQAGAAIAAQUAKQACAAEPAAkAAABDSUF1ZGl0ZWQCAAEFAAIABwABAAAABQADAAcAAAAAAAUABQACAAEFAGIACgBjAAAA2YoAAAUAZAAPAAMAAABIdWI=
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 20998
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.199.223; helo=ny.mirrors.kernel.org; envelope-from=netdev+bounces-83499-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com 163672025D
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711793981; cv=none; b=XjBCD05gp0RzPexcO+ruoj3Fvp0FHXH+g1yfSbBCSauFIO1tUJvCAj18ickaY2KtMh11GdCoGwv3yLyQZoDDBinyTfTzxZ5XaxHx7XGBoBo5iGdcqn7ARJxFLji2YUWRwxjWGn6aW3Oinox5cToQXAPElCFyZ7MFApmpor1VULY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711793981; c=relaxed/simple;
	bh=Kj8wuHAHZVd+Kvn7QFiN9E4M/87APJxMIBq/ikHQ35Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilzO63a9w9glrMWlidF2JyKlGjQXsTBHUwYWqKLjURwPleSvCK0pu0qEQdVpkPgBj5Tx3dxnOZS852pfce8pAD873pPxN2FP6XW++Ruqeqw5s1oHFlXc5dC6RReHxltRJkkBQ+ajCbNKwPRUITLQoWw6vma09F/1Pl3fF0oK81s=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Message-ID: <95e1978f-341c-4de5-a665-e057fe97a060@huaweicloud.com>
Date: Sat, 30 Mar 2024 18:19:24 +0800
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Stefan O'Rear <sorear@fastmail.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko
	<mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
	<pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <20240329-linguini-uncured-380cb4cff61c@wendy>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20240329-linguini-uncured-380cb4cff61c@wendy>
X-CM-TRANSID: Syh0CgCXug0s5wdmXWTTIg--.19989S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4UGFW5XF4UXrWDGFW5GFg_yoWrtF4DpF
	WfKF1xKFn7Jw1fZ393Xw18Wr1093Z7Kw43GrykG34Fy343ur1xGw1qy3ZrXFyDZrn3Gr1a
	v390gF1q93WUCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_174307_278982_08DF7545 
X-CRM114-Status: GOOD (  37.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
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
Message-ID: <20240330101924.M5oHnEvflJyLGs8-qOcLVMSTSMjKombrHskxoNiDUzU@z>

Thanks for the clarification, looks good.

On 2024/3/29 19:23, Conor Dooley wrote:
> On Thu, Mar 28, 2024 at 10:07:23PM +0000, Conor Dooley wrote:
> 
>> As I said on IRC to you earlier, I think the Kconfig options here are in
>> need of a bit of a spring cleaning - they should be modified to explain
>> their individual purposes, be that enabling optimisations in the kernel
>> or being required for userspace. I'll try to send a patch for that if
>> I remember tomorrow.
> 
> Something like this:
> 
> -- >8 --
> commit 5125504beaedd669b082bf74b02003a77360670f
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Fri Mar 29 11:13:22 2024 +0000
> 
>      RISC-V: clarify what some RISCV_ISA* config options do
>      
>      During some discussion on IRC yesterday and on Pu's bpf patch [1]
>      I noticed that these RISCV_ISA* Kconfig options are not really clear
>      about their implications. Many of these options have no impact on what
>      userspace is allowed to do, for example an application can use Zbb
>      regardless of whether or not the kernel does. Change the help text to
>      try and clarify whether or not an option affects just the kernel, or
>      also userspace. None of these options actually control whether or not an
>      extension is detected dynamically as that's done regardless of Kconfig
>      options, so drop any text that implies the option is required for
>      dynamic detection, rewording them as "do x when y is detected".
>      
>      Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>      ---
>      I did this based on top of Samuel's changes dropping the MMU
>      requurements just in case, but I don't think there's a conflict:
>      https://lore.kernel.org/linux-riscv/20240227003630.3634533-4-samuel.holland@sifive.com/
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8a777f59402..f327a8ac648f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -501,8 +501,8 @@ config RISCV_ISA_SVNAPOT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension when it is detected by
> +	  the kernel at boot.
>   
>   	  The Svnapot extension is used to mark contiguous PTEs as a range
>   	  of contiguous virtual-to-physical translations for a naturally
> @@ -520,9 +520,9 @@ config RISCV_ISA_SVPBMT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) when it is detected by the kernel at
> +	   boot.
>   
>   	   The memory type for a page contains a combination of attributes
>   	   that indicate the cacheability, idempotency, and ordering
> @@ -541,14 +541,15 @@ config TOOLCHAIN_HAS_V
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>   	depends on TOOLCHAIN_HAS_V
>   	depends on FPU
>   	select DYNAMIC_SIGFRAME
>   	default y
>   	help
>   	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> @@ -606,8 +607,8 @@ config RISCV_ISA_ZBB
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>   
>   	   The Zbb extension provides instructions to accelerate a number
>   	   of bit-specific operations (count bit population, sign extending,
> @@ -623,9 +624,9 @@ config RISCV_ISA_ZICBOM
>   	select RISCV_DMA_NONCOHERENT
>   	select DMA_DIRECT_REMAP
>   	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>   
>   	   The Zicbom extension can be used to handle for example
>   	   non-coherent DMA support on devices that need it.
> @@ -684,7 +685,8 @@ config FPU
>   	default y
>   	help
>   	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> 


X-sender: <netdev+bounces-83499-steffen.klassert=secunet.com@vger.kernel.org>
X-Receiver: <steffen.klassert@secunet.com> ORCPT=rfc822;steffen.klassert@secunet.com NOTIFY=NEVER; X-ExtendedProps=BQAVABYAAgAAAAUAFAARAPDFCS25BAlDktII2g02frgPADUAAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuSXNSZXNvdXJjZQIAAAUAagAJAAEAAAAAAAAABQAWAAIAAAUAQwACAAAFAEYABwADAAAABQBHAAIAAAUAEgAPAGIAAAAvbz1zZWN1bmV0L291PUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpL2NuPVJlY2lwaWVudHMvY249U3RlZmZlbiBLbGFzc2VydDY4YwUACwAXAL4AAACheZxkHSGBRqAcAp3ukbifQ049REI2LENOPURhdGFiYXNlcyxDTj1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKSxDTj1BZG1pbmlzdHJhdGl2ZSBHcm91cHMsQ049c2VjdW5ldCxDTj1NaWNyb3NvZnQgRXhjaGFuZ2UsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zZWN1bmV0LERDPWRlBQAOABEABiAS9uuMOkqzwmEZDvWNNQUAHQAPAAwAAABtYngtZXNzZW4tMDIFADwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwARAAAAS2xhc3NlcnQsIFN0ZWZmZW4FAAwAAgAABQBsAAIAAAUAWAAXAEoAAADwxQktuQQJQ5LSCNoNNn64Q049S2xhc3NlcnQgU3RlZmZlbixPVT1Vc2VycyxPVT1NaWdyYXRpb24sREM9c2VjdW5ldCxEQz1kZQUAJgACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAjAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAU4mmlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAHAAAAHN0ZWZmZW4ua2xhc3NlcnRAc2VjdW5ldC5jb20FAAYAAgABBQApAAIAAQ8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAYgAKAGQAAADZigAABQBkAA8AAwAAAEh1Yg==
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 21009
Received: from cas-essen-02.secunet.de (10.53.40.202) by
 mbx-essen-02.secunet.de (10.53.40.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sat, 30 Mar 2024 11:19:50 +0100
Received: from b.mx.secunet.com (62.96.220.37) by cas-essen-02.secunet.de
 (10.53.40.202) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Sat, 30 Mar 2024 11:19:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by b.mx.secunet.com (Postfix) with ESMTP id DA4E3202BE
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 11:19:50 +0100 (CET)
X-Virus-Scanned: by secunet
X-Spam-Flag: NO
X-Spam-Score: -2.651
X-Spam-Level:
X-Spam-Status: No, score=-2.651 tagged_above=-999 required=2.1
	tests=[BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
	MAILING_LIST_MULTI=-1, RCVD_IN_DNSWL_NONE=-0.0001,
	SPF_HELO_NONE=0.001, SPF_PASS=-0.001]
	autolearn=unavailable autolearn_force=no
Received: from b.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19NrXs2x69LU for <steffen.klassert@secunet.com>;
	Sat, 30 Mar 2024 11:19:49 +0100 (CET)
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.80.249; helo=am.mirrors.kernel.org; envelope-from=netdev+bounces-83499-steffen.klassert=secunet.com@vger.kernel.org; receiver=steffen.klassert@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com D53502025D
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by b.mx.secunet.com (Postfix) with ESMTPS id D53502025D
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 11:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB3D1F22438
	for <steffen.klassert@secunet.com>; Sat, 30 Mar 2024 10:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F26528DDF;
	Sat, 30 Mar 2024 10:19:41 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE2C11712;
	Sat, 30 Mar 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711793981; cv=none; b=XjBCD05gp0RzPexcO+ruoj3Fvp0FHXH+g1yfSbBCSauFIO1tUJvCAj18ickaY2KtMh11GdCoGwv3yLyQZoDDBinyTfTzxZ5XaxHx7XGBoBo5iGdcqn7ARJxFLji2YUWRwxjWGn6aW3Oinox5cToQXAPElCFyZ7MFApmpor1VULY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711793981; c=relaxed/simple;
	bh=Kj8wuHAHZVd+Kvn7QFiN9E4M/87APJxMIBq/ikHQ35Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilzO63a9w9glrMWlidF2JyKlGjQXsTBHUwYWqKLjURwPleSvCK0pu0qEQdVpkPgBj5Tx3dxnOZS852pfce8pAD873pPxN2FP6XW++Ruqeqw5s1oHFlXc5dC6RReHxltRJkkBQ+ajCbNKwPRUITLQoWw6vma09F/1Pl3fF0oK81s=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4V6Ctd17Lrz4f3lgL;
	Sat, 30 Mar 2024 18:19:21 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 64B191A0568;
	Sat, 30 Mar 2024 18:19:29 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgCXug0s5wdmXWTTIg--.19989S2;
	Sat, 30 Mar 2024 18:19:25 +0800 (CST)
Message-ID: <95e1978f-341c-4de5-a665-e057fe97a060@huaweicloud.com>
Date: Sat, 30 Mar 2024 18:19:24 +0800
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/5] riscv, bpf: Relax restrictions on Zbb
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
CC: Stefan O'Rear <sorear@fastmail.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko
	<mykolal@fb.com>, Manu Bretelle <chantr4@gmail.com>, Pu Lehui
	<pulehui@huawei.com>
References: <20240328124916.293173-1-pulehui@huaweicloud.com>
 <20240328124916.293173-3-pulehui@huaweicloud.com>
 <3ed9fe94-2610-41eb-8a00-a9f37fcf2b1a@app.fastmail.com>
 <20240328-ferocity-repose-c554f75a676c@spud>
 <20240329-linguini-uncured-380cb4cff61c@wendy>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20240329-linguini-uncured-380cb4cff61c@wendy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgCXug0s5wdmXWTTIg--.19989S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4UGFW5XF4UXrWDGFW5GFg_yoWrtF4DpF
	WfKF1xKFn7Jw1fZ393Xw18Wr1093Z7Kw43GrykG34Fy343ur1xGw1qy3ZrXFyDZrn3Gr1a
	v390gF1q93WUCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbG2NtUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
Return-Path: netdev+bounces-83499-steffen.klassert=secunet.com@vger.kernel.org
X-MS-Exchange-Organization-OriginalArrivalTime: 30 Mar 2024 10:19:50.9305
 (UTC)
X-MS-Exchange-Organization-Network-Message-Id: 922a0c38-9365-43f6-727c-08dc50a2ef4a
X-MS-Exchange-Organization-OriginalClientIPAddress: 62.96.220.37
X-MS-Exchange-Organization-OriginalServerIPAddress: 10.53.40.202
X-MS-Exchange-Organization-Cross-Premises-Headers-Processed: cas-essen-02.secunet.de
X-MS-Exchange-Organization-OrderedPrecisionLatencyInProgress: LSRV=mbx-essen-02.secunet.de:TOTAL-HUB=0.192|SMR=0.113(SMRDE=0.003|SMRC=0.109(SMRCL=0.108|X-SMRCR=0.065))|CAT=0.078(CATOS=0.001
 |CATRESL=0.027(CATRESLP2R=0.021)|CATORES=0.047(CATRS=0.047(CATRS-Transport
 Rule Agent=0.001 (X-ETREX=0.001)|CATRS-Index Routing
 Agent=0.045)));2024-03-30T10:19:51.131Z
X-MS-Exchange-Forest-ArrivalHubServer: mbx-essen-02.secunet.de
X-MS-Exchange-Organization-AuthSource: cas-essen-02.secunet.de
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-FromEntityHeader: Internet
X-MS-Exchange-Organization-OriginalSize: 12913
X-MS-Exchange-Organization-HygienePolicy: Standard
X-MS-Exchange-Organization-MessageLatency: SRV=cas-essen-02.secunet.de:TOTAL-FE=0.008|SMR=0.008(SMRPI=0.006(SMRPI-FrontendProxyAgent=0.006))
X-MS-Exchange-Organization-Recipient-Limit-Verified: True
X-MS-Exchange-Organization-TotalRecipientCount: 1
X-MS-Exchange-Organization-Rules-Execution-History: 0b0cf904-14ac-4724-8bdf-482ee6223cf2%%%fd34672d-751c-45ae-a963-ed177fcabe23%%%d8080257-b0c3-47b4-b0db-23bc0c8ddb3c%%%95e591a2-5d7d-4afa-b1d0-7573d6c0a5d9%%%f7d0f6bc-4dcc-4876-8c5d-b3d6ddbb3d55%%%16355082-c50b-4214-9c7d-d39575f9f79b
X-MS-Exchange-Forest-RulesExecuted: mbx-essen-02
X-MS-Exchange-Organization-RulesExecuted: mbx-essen-02
X-MS-Exchange-Forest-IndexAgent-0: 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
 DSriaWYUjYLhaqbUbdYy8s/B7cKY197XViUNcwZwVMTTnEW5/xwgD/
 JyptQ/y9HOBukeQQILuXBVrHDDpMdvWJj2stkcybT0KoufZsUSicHn
 /4AVVbN3NHlPWczIfIcA5e2J87jKDT9PN2eZJ5nSzHNqBQQFbbt41a
 DtD5IYmO5aefKFnOfHZ/SI6JiTq+n2sfJZ8nOYvPM2aL8gmdX7VC9I
 fluQrOVngHqJ7c/y8LMGW8vLP+s2X+fh53tWvrHOVBqfQIDT+ln6QW
 JZLHB3/V1I+C/a/EeECx4AAAEK4QE8P3htbCB2ZXJzaW9uPSIxLjAi
 IGVuY29kaW5nPSJ1dGYtMTYiPz4NCjxFbWFpbFNldD4NCiAgPFZlcn
 Npb24+MTUuMC4wLjA8L1ZlcnNpb24+DQogIDxFbWFpbHM+DQogICAg
 PEVtYWlsIFN0YXJ0SW5kZXg9IjU5OSI+DQogICAgICA8RW1haWxTdH
 Jpbmc+Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb208L0VtYWlsU3Ry
 aW5nPg0KICAgIDwvRW1haWw+DQogIDwvRW1haWxzPg0KPC9FbWFpbF
 NldD4BC7wDPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRm
 LTE2Ij8+DQo8VXJsU2V0Pg0KICA8VmVyc2lvbj4xNS4wLjAuMDwvVm
 Vyc2lvbj4NCiAgPFVybHM+DQogICAgPFVybCBTdGFydEluZGV4PSIx
 NTIxIiBUeXBlPSJVcmwiPg0KICAgICAgPFVybFN0cmluZz5odHRwcz
 ovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMyOC1m
 ZXJvY2l0eS1yZXBvc2UtYzU1NGY3NWE2NzZjQHNwdWQvPC9VcmxTdH
 Jpbmc+DQogICAgPC9Vcmw+DQogICAgPFVybCBTdGFydEluZGV4PSIx
 ODMyIiBUeXBlPSJVcmwiPg0KICAgICAgPFVybFN0cmluZz5odHRwcz
 ovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDIyNzAw
 MzYzMC4zNjM0NTMzLTQtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS
 88L1VybFN0cmluZz4NCiAgICA8L1VybD4NCiAgPC9VcmxzPg0KPC9V
 cmxTZXQ+AQz9Bjw/eG1sIHZlcnNpb249IjEuMCIgZW5jb2Rpbmc9In
 V0Zi0xNiI/Pg0KPENvbnRhY3RTZXQ+DQogIDxWZXJzaW9uPjE1LjAu
 MC4wPC9WZXJzaW9uPg0KICA8Q29udGFjdHM+DQogICAgPENvbnRhY3
 QgU3RhcnRJbmRleD0iNTg1Ij4NCiAgICAgIDxQZXJzb24gU3RhcnRJ
 bmRleD0iNTg1Ij4NCiAgICAgICAgPFBlcnNvblN0cmluZz5Db25vci
 BEb29sZXk8L1BlcnNvblN0cmluZz4NCiAgICAgIDwvUGVyc29uPg0K
 ICAgICAgPEVtYWlscz4NCiAgICAgICAgPEVtYWlsIFN0YXJ0SW5kZX
 g9IjU5OSI+DQogICAgICAgICAgPEVtYWlsU3RyaW5nPmNvbm9yLmRv
 b2xleUBtaWNyb2NoaXAuY29tPC9FbWFpbFN0cmluZz4NCiAgICAgIC
 AgPC9FbWFpbD4NCiAgICAgIDwvRW1haWxzPg0KICAgICAgPENvbnRh
 Y3RTdHJpbmc+Q29ub3IgRG9vbGV5ICZsdDtjb25vci5kb29sZXlAbW
 ljcm9jaGlwLmNvbTwvQ29udGFjdFN0cmluZz4NCiAgICA8L0NvbnRh
 Y3Q+DQogICAgPENvbnRhY3QgU3RhcnRJbmRleD0iMTYyOCI+DQogIC
 AgICA8UGVyc29uIFN0YXJ0SW5kZXg9IjE2MjgiPg0KICAgICAgICA8
 UGVyc29uU3RyaW5nPkNvbm9yIERvb2xleTwvUGVyc29uU3RyaW5nPg
 0KICAgICAgPC9QZXJzb24+DQogICAgICA8RW1haWxzPg0KICAgICAg
 ICA8RW1haWwgU3RhcnRJbmRleD0iMTY0MiI+DQogICAgICAgICAgPE
 VtYWlsU3RyaW5nPmNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPC9F
 bWFpbFN0cmluZz4NCiAgICAgICAgPC9FbWFpbD4NCiAgICAgIDwvRW
 1haWxzPg0KICAgICAgPENvbnRhY3RTdHJpbmc+Q29ub3IgRG9vbGV5
 ICZsdDtjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbTwvQ29udGFjdF
 N0cmluZz4NCiAgICA8L0NvbnRhY3Q+DQogIDwvQ29udGFjdHM+DQo8
 L0NvbnRhY3RTZXQ+AQ7PAVJldHJpZXZlck9wZXJhdG9yLDEwLDI7Um
 V0cmlldmVyT3BlcmF0b3IsMTEsMjtQb3N0RG9jUGFyc2VyT3BlcmF0
 b3IsMTAsMTtQb3N0RG9jUGFyc2VyT3BlcmF0b3IsMTEsMDtQb3N0V2
 9yZEJyZWFrZXJEaWFnbm9zdGljT3BlcmF0b3IsMTAsNTtQb3N0V29y
 ZEJyZWFrZXJEaWFnbm9zdGljT3BlcmF0b3IsMTEsMDtUcmFuc3Bvcn
 RXcml0ZXJQcm9kdWNlciwyMCwyMg==
X-MS-Exchange-Forest-IndexAgent: 1 4678
X-MS-Exchange-Forest-EmailMessageHash: 06F33EE3
X-MS-Exchange-Forest-Language: en
X-MS-Exchange-Organization-Processed-By-Journaling: Journal Agent

Thanks for the clarification, looks good.

On 2024/3/29 19:23, Conor Dooley wrote:
> On Thu, Mar 28, 2024 at 10:07:23PM +0000, Conor Dooley wrote:
> 
>> As I said on IRC to you earlier, I think the Kconfig options here are in
>> need of a bit of a spring cleaning - they should be modified to explain
>> their individual purposes, be that enabling optimisations in the kernel
>> or being required for userspace. I'll try to send a patch for that if
>> I remember tomorrow.
> 
> Something like this:
> 
> -- >8 --
> commit 5125504beaedd669b082bf74b02003a77360670f
> Author: Conor Dooley <conor.dooley@microchip.com>
> Date:   Fri Mar 29 11:13:22 2024 +0000
> 
>      RISC-V: clarify what some RISCV_ISA* config options do
>      
>      During some discussion on IRC yesterday and on Pu's bpf patch [1]
>      I noticed that these RISCV_ISA* Kconfig options are not really clear
>      about their implications. Many of these options have no impact on what
>      userspace is allowed to do, for example an application can use Zbb
>      regardless of whether or not the kernel does. Change the help text to
>      try and clarify whether or not an option affects just the kernel, or
>      also userspace. None of these options actually control whether or not an
>      extension is detected dynamically as that's done regardless of Kconfig
>      options, so drop any text that implies the option is required for
>      dynamic detection, rewording them as "do x when y is detected".
>      
>      Link: https://lore.kernel.org/linux-riscv/20240328-ferocity-repose-c554f75a676c@spud/ [1]
>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>      ---
>      I did this based on top of Samuel's changes dropping the MMU
>      requurements just in case, but I don't think there's a conflict:
>      https://lore.kernel.org/linux-riscv/20240227003630.3634533-4-samuel.holland@sifive.com/
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d8a777f59402..f327a8ac648f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -501,8 +501,8 @@ config RISCV_ISA_SVNAPOT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	  Allow kernel to detect the Svnapot ISA-extension dynamically at boot
> -	  time and enable its usage.
> +	  Add support for the Svnapot ISA-extension when it is detected by
> +	  the kernel at boot.
>   
>   	  The Svnapot extension is used to mark contiguous PTEs as a range
>   	  of contiguous virtual-to-physical translations for a naturally
> @@ -520,9 +520,9 @@ config RISCV_ISA_SVPBMT
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the Svpbmt
> -	   ISA-extension (Supervisor-mode: page-based memory types) and
> -	   enable its usage.
> +	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
> +	   page-based memory types) when it is detected by the kernel at
> +	   boot.
>   
>   	   The memory type for a page contains a combination of attributes
>   	   that indicate the cacheability, idempotency, and ordering
> @@ -541,14 +541,15 @@ config TOOLCHAIN_HAS_V
>   	depends on AS_HAS_OPTION_ARCH
>   
>   config RISCV_ISA_V
> -	bool "VECTOR extension support"
> +	bool "Vector extension support"
>   	depends on TOOLCHAIN_HAS_V
>   	depends on FPU
>   	select DYNAMIC_SIGFRAME
>   	default y
>   	help
>   	  Say N here if you want to disable all vector related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> @@ -606,8 +607,8 @@ config RISCV_ISA_ZBB
>   	depends on RISCV_ALTERNATIVE
>   	default y
>   	help
> -	   Adds support to dynamically detect the presence of the ZBB
> -	   extension (basic bit manipulation) and enable its usage.
> +	   Add support for enabling optimisations in the kernel when the
> +	   Zbb extension is detected at boot.
>   
>   	   The Zbb extension provides instructions to accelerate a number
>   	   of bit-specific operations (count bit population, sign extending,
> @@ -623,9 +624,9 @@ config RISCV_ISA_ZICBOM
>   	select RISCV_DMA_NONCOHERENT
>   	select DMA_DIRECT_REMAP
>   	help
> -	   Adds support to dynamically detect the presence of the ZICBOM
> -	   extension (Cache Block Management Operations) and enable its
> -	   usage.
> +	   Add support for the Zicbom extension (Cache Block Management
> +	   Operations) and enable its use in the kernel when it is detected
> +	   at boot.
>   
>   	   The Zicbom extension can be used to handle for example
>   	   non-coherent DMA support on devices that need it.
> @@ -684,7 +685,8 @@ config FPU
>   	default y
>   	help
>   	  Say N here if you want to disable all floating-point related procedure
> -	  in the kernel.
> +	  in the kernel. Without this option enabled, neither the kernel nor
> +	  userspace may use vector.
>   
>   	  If you don't know what to do here, say Y.
>   
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
