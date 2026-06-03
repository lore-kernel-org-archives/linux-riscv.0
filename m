Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20A0CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 12:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vq8qABI9H8apo2BmBZtWENfDOzXxzl+7vCb6V9hoAyg=; b=1mHV1ym6cHni8e
	dHFmEloEuBsHDhBiwjAGpzDEcT16ylp4QmOWVQv1LBXgN0qbPVtHtl+EMRgteLBtx4I3Mnu1uwRgB
	xmtrHT+FFWgjJW9o0KYpligBxLIGJj47J14jgYuyec66B/hW8Gwims/+1p9qBhKP5VjtwlB9V3m16
	F7wDu0FL5pXUfhKe5F249/XpJu992i1Ul8YW+WUChq7NwhS6kUDVFVgqLLUY/Nf61IrN0uYUHKKhM
	HjJFwHJyo7Xpq5ffrEdch3Tjizamg3Bq4tMJY6oIPxBA0e3+3urhXmuNlq9lYne5PsV+5noPB8xR2
	oluM1LZi/qysz8eaxDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkm7-0000000F56C-1JOo;
	Wed, 03 Jun 2026 12:32:47 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkm4-0000000F55D-43GS
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 12:32:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf1f074a12so56636625ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780489962; x=1781094762; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDeuMdiaAlzBD3KH8UwifnbgyrvnQwNbJEPlcUd8KQc=;
        b=IsheZFaKOQ/FsAqqD8v74zeM81oues/+tDM3K5tVgg9wE/WjcFGi32mgVRqTuh9a8K
         jL1PN6MmuE7wZTZkg8mYnFBsBp2+6Wuaz1zUdslgVmwqlfAFjjuCs1rkvNNYN53qJ6G6
         6MXLj668qfyRzfX3nD/xFPkwcTTSarQeyM4TyisliwkOJMK/LTZ9o/z8B58wyKl3H8Ut
         RmTgizo+FAnIQCBAxtGham16QncsmM6Gn5gj01L6nY04gHSlJjuX2HYWoQRVewuTEQ6T
         OgoeVf974XFAMP3usPxRnu2VjgUdwLIE9qLCkvI5FxuxpWtmpZeeYpsn1NeI26ICLhNm
         1YJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780489962; x=1781094762;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDeuMdiaAlzBD3KH8UwifnbgyrvnQwNbJEPlcUd8KQc=;
        b=lXCOf1j2HPBPoO13z+9yQupv+031mjkjOH9MiLRRBpGQW4jUBzm+MxxBXCQdGEetBg
         YFzKdGH4XB6qi89x4VJFzVXHV/Agfkm/pH/he7MFhNa1COD6vrIMFofFcztT/OH9JtfB
         SOSaDZglBhuiwPwFY9yhvxRXbefkD55/KSSBYHDgguzDkmd36+eMfFLnagnpOV41DWTE
         /XfEH1HmcD9GJ5Giltu/GiWS2GjxXEyimZgXN+DALksB6Q1CZc5bMAAGWiS+ZoK1+Flg
         FM0c4AnMBKGbvk46JYFczz2pPXBMSz19m6gPMeiyGg1Zp2KJXVJy24NEtS2CCKtsSZtg
         nsNA==
X-Forwarded-Encrypted: i=1; AFNElJ9LbyPjYvceKap6B1VxgwbwlNytukqwMTNDy0fyHclDpjzNxUM3AO2nZNU6M6Kr/ek91bAho6YOMnRt6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnIPId1Su9ooueuafxYj8rLru96r+p2dO9IiQ/AlQHHh20vSZI
	l9dSRFkWWq1QQDlm1LQ7Hsb8jROT2ssitlx5KDGYcwkIt5479eOVUnQDNCaDWlgfM+0=
X-Gm-Gg: Acq92OEIpbe2FES8/RWmk3stzq1k/PtF8oMnm5U1kmsP8uaAmB1XK+6d1dmbDrtviEX
	WIYV3CapDcLhIA8kv16o4FR7OTdxhaNPlmGPNDV8jSPqLMSjxRea+CuIxxpTyO3Czx5WdOwJ42s
	HSjUejrA5exm6Odk+bYrzZMnvKpPFj03OxmWpjTHlUmQvvgXcfWx0HqAOkWf2uRxGlqXpvwUFBQ
	n+quirS6b6KMo7vsRukImKvzlfFqlLUpFRa4vG5q5yllXWdJpJchNzaaVBsFS01O2yOPCJRHyMn
	wQ1V28Q0nRNJyHerfzy2pqOgheAuuvatCbt163lQ13noDCBx2edP5+0IY6af3ScXYxAtdPaHiGu
	xlPRF8VGFzt4Ju5HKcogXmINQBR5KMvjzagA7xWG0Z9sDD7uGfcgLAjT5d5c/pleBQ02ZWXg2id
	l+VBZHfzQMTm0dXEcEMwgibLlFZQ+yrgIPgplFpRsZl20BFQ==
X-Received: by 2002:a17:903:2c47:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1640ac13emr35790755ad.29.1780489961586;
        Wed, 03 Jun 2026 05:32:41 -0700 (PDT)
Received: from smtpclient.apple ([240e:694:e20:401::4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa0236sm24929025ad.33.2026.06.03.05.32.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2026 05:32:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <20260530-spoils-studied-d0858257c982@spud>
Date: Wed, 3 Jun 2026 20:32:14 +0800
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Deepak Gupta <debug@rivosinc.com>,
 Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
 Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
 Hui Wang <hui.wang@canonical.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Xu Lu <luxu.kernel@bytedance.com>,
 Guodong Xu <guodong@riscstar.com>
Message-Id: <68DF4B69-6693-447A-ADAC-E943F96CFB77@bytedance.com>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
 <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
 <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
 <20260530-spoils-studied-d0858257c982@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_053245_016975_AB5DEF95 
X-CRM114-Status: GOOD (  22.69  )
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



> On May 31, 2026, at 07:09, Conor Dooley <conor@kernel.org> wrote:
> 
> On Sat, May 30, 2026 at 11:36:11AM +0800, Qingwei Hu wrote:
>> Hi Vivian,
>> 
>> Thanks for the feedback.
>> 
>>> On May 29, 2026, at 11:14, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
>>> 
>>> On 5/28/26 22:16, Qingwei Hu wrote:
>>>> Zic64b describes a platform with 64-byte cache block sizes. It is a
>>>> mandatory part of RVA23U64, but a system may provide 64-byte CMO block
>>>> sizes without satisfying all profile requirements.
>>>> 
>>>> The ISA string parser currently ignores Zic64b because the extension is
>>>> not present in the cpufeature table. Add an ISA extension ID and table
>>>> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
>>>> advertises it.
>>> 
>>> I'd like to understand: What is the motivation to doing this, given that
>>> the very same information is already available as riscv,cbo*-block-size
>>> and hwprobe?
>> 
>> The motivation here is not to replace riscv,cbo*-block-size or hwprobe.
>> Those are still the right interfaces for software that needs the actual
>> CBO block size.
>> 
>> This is more about preserving the ISA extension name reported by
>> firmware. Some platforms report zic64b in the ISA string, but Linux
>> currently drops it because there is no cpufeature entry, so cpuinfo no
>> longer matches what firmware advertised. That makes profile/ISA-string
>> comparison tools a bit awkward.
>> 
>> So the patch only makes zic64b visible as a named ISA extension when
>> firmware reports it, while still validating it against any CBO block
>> sizes that firmware provides.
>> 
>>> If an extension is what we want to go with, then
>>> Documentation/devicetree/bindings/riscv/extensions.yaml also needs
>>> updating to match.
>> 
>> And yes, if we keep this direction, I agree extensions.yaml should be
>> updated in v2.
> 
> And make sure that having zic64b makes the cbo*-block-size properties
> mandatory so that people don't confuse themselves and omit them and
> wonder why stuff doesn't work.
> 
> Does zic64b mean that all of the zicbo* extensions are supported, or
> does it just mean that the supported ones use 64-byte block sizes?
> The answer to that will impact how you make the cbo*-block-size
> properties mandatory.
> 
> Cheers,
> Conor.

Thanks, I will check this with the RISC-V unprivileged/ISA folks first,
and then handle the binding accordingly in v2.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
