Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089E7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Apr 2022 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ybi9zycjDCrCXH/g03L8MISit2iJqvZF5QUCh0dxX3s=; b=ARzhKt85splM/v
	MDPDzwLLJgrQuarHlrXq0guelHat9+xYY/hVdlTMm+Ju8onPF1/u+e1FlpGJGTeDtjuOc9RPYHnGV
	Gphd6dAq26NQkhF72WmlFQeecWQhbDx8iF+P0X1l0fuJ2GyUxXisnokpoZmFHL/eVqhjK7JHZ2iQW
	VAg3j1si3ImqAke4sARwj7eFGFUOnbFVeJAngLPiuDLwvvGfce0hLBR+sadzpWod3XjZEQ71GjSeO
	EbLr9wi6V6e9UTetm1wiz0HvImcaZw3XL5ownYQjiSRvRpPG9gZ7/HnYzXq9qfe4HNF/HeXkaWuvL
	crOajN3p78Z0c4cJcguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDfM-00CvZv-AG; Mon, 04 Apr 2022 03:46:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDfJ-00CvZb-8q
 for linux-riscv@lists.infradead.org; Mon, 04 Apr 2022 03:46:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r11-20020a1c440b000000b0038ccb70e239so1276463wma.3
 for <linux-riscv@lists.infradead.org>; Sun, 03 Apr 2022 20:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zIEWjwIftCsbXsyVaKrbxiQ3YI3B53hkXz7cL3Cg4Hk=;
 b=5NLJ/H5VwJU9/XJjgnCvziAUiVTZmUTWR+QTk5YqSNeNhj6yLp5udBH8IXnkRyqfen
 7ZMH7/kbxkU3fVc6e7d+20rQRfniY5BwYwRN1bTzqBHuoFPd4gjk6Crt17D/Ksd+WFBN
 YC24GmWYZZrG59JApll5m8/7lxBs3UV9MWI5+k+Od/BrzhtJ2E2QTr8RuOh+yOpBcvhj
 /gdekB1g6P+n/7lc7AqNcSR7dVbLUBfkvnw+VANgZor1xLG7MbPj6G32g8aEhsgczqTQ
 nupBrMvFISqcO3bnR+8PmjHidV4jhgdyjY3yxzgHjJt7aB73xNayUU/HkBphiwCVDdLB
 8GsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zIEWjwIftCsbXsyVaKrbxiQ3YI3B53hkXz7cL3Cg4Hk=;
 b=Qd/oC4R13PFBFH4HpdGFRUWh/W2FpNhKeNHIatOtGZ1erhKYUj+4MR9t/qiAOVfEI2
 U4RLYfHA658lbGPef/CpHYKloMUZjaMHx6aB7x9ybjW+tM5GnL7RVmN8VL+WyeomV3Zd
 hqDsUV+0GOcKgRVJlZxH2oRf0Jw68r/GEy2xDPZh3N1ldkr4KlrGoMDAu3d1YWovEXXL
 5lH1Qit/v1Sd97y0XYeqKJ2LDQou9+smUVcqvIcHT69BGf0Xt/fY19vTTqR9TowY3AS4
 iZ3O5jV4usxpB7klUSEAx9KiaxCjn0sqjssKT3vSPKn8ct4WZwyAr6TQ29bLigjTV+r2
 N0vQ==
X-Gm-Message-State: AOAM531aIEpWx6kM07RWRE2O5M3n3OEDiE9pVaZ/VotrE0d3JjL74mH9
 Yi9Hmjnf3YIm+jtRMVTkX9EUgOUWLcuT+tUGhkoDSA==
X-Google-Smtp-Source: ABdhPJxWy3ASdc1fdzlTkh/icaTSsaUSRXwwU+/7EXnNF1pjk9RZzqkcq+Ab3qtG3iS4I7Z32SL1kMxGGrKs6m5vxIg=
X-Received: by 2002:a05:600c:6d4:b0:38e:7622:9983 with SMTP id
 b20-20020a05600c06d400b0038e76229983mr450885wmn.93.1649043963147; Sun, 03 Apr
 2022 20:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220403065735.23859-1-bagasdotme@gmail.com>
In-Reply-To: <20220403065735.23859-1-bagasdotme@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Apr 2022 09:14:53 +0530
Message-ID: <CAAhSdy0G4o16Qdt2ZPDAD5M6Updopdm43La2q4t6xVA540WXdw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Documentation: kvm: Add missing line break in
 api.rst
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Anup Patel <anup.patel@wdc.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, KVM General <kvm@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_204605_352768_BB4598DD 
X-CRM114-Status: GOOD (  16.42  )
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

On Sun, Apr 3, 2022 at 12:28 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> Add missing line break separator between literal block and description
> of KVM_EXIT_RISCV_SBI.
>
> This fixes:
> </path/to/linux>/Documentation/virt/kvm/api.rst:6118: WARNING: Literal block ends without a blank line; unexpected unindent.
>
> Fixes: da40d85805937d (RISC-V: KVM: Document RISC-V specific parts of KVM API, 2021-09-27)
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: kvm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

For KVM RISC-V related patches, please CC kvm-riscv@lists.infradead.org

Otherwise, this looks good to me. I have queued this for RC fixes.

Thanks,
Anup

> ---
>  Documentation/virt/kvm/api.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 9f3172376ec3a6..a529f94b61edcd 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6115,6 +6115,7 @@ Valid values for 'type' are:
>                         unsigned long args[6];
>                         unsigned long ret[2];
>                 } riscv_sbi;
> +
>  If exit reason is KVM_EXIT_RISCV_SBI then it indicates that the VCPU has
>  done a SBI call which is not handled by KVM RISC-V kernel module. The details
>  of the SBI call are available in 'riscv_sbi' member of kvm_run structure. The
>
> base-commit: f443e374ae131c168a065ea1748feac6b2e76613
> --
> An old man doll... just what I always wanted! - Clara
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
