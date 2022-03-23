Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E73DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 16:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4uWUkXd8R5sR+dBhkxpBWeiX+Xs8NvWapiilBZd4sVA=; b=xkgYdJ1gjhkrvr
	agigDDsukg+h09tPpfxxHfjT+AH0WElpJ+BVZTurumUKtLnFj7y4XrTg7xqey5zz6R+as2A+CEPDV
	hHfL2SnjfKuyQWCcdGOT7mOMT6YKiBK+Br5TJE82kKnJyDxfS3PAUUNxqz0FQElncwRta7CeHzsWW
	vi1anvVa5N4p0HdOuGH9Eh4QAYxdNk+Z85npWtdCpQzm8RC7RmimJo5PxXQmfUeF0IsW4SNT+pKl5
	8cgeNDoTIFDs9rqY7x/b94PKBy51b0ao3//2cJU2VJNxddn/3H3A7C7pd94ST7CA8m5O+ejanNaWW
	C4ttlinSzP80MAbmVHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX3ei-00EDTT-Re; Wed, 23 Mar 2022 16:16:16 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX3ee-00EDSs-9W
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 16:16:16 +0000
Received: by mail-pj1-x1035.google.com with SMTP id jx9so2152813pjb.5
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=9QGzds+IdCGonqV0kBh9pv068c001U9EacoHZjtzuCc=;
 b=AwydI7Mm6PTph1BAnxxl5fpdhwwYpLoCKHaIC+fNa9O2iKr5mgkqXch7Rh8p/cm/iR
 9vbKrMpJf44v+58llTdIWHZARvpMsuOtVVD33TK6HnLH5njEmPXtjs8qVOqbROIxYbgL
 0nXaWgXsGisPIxCC15fGx/1rnze5SPeO+HWBVSDiBYHJhHjgjHoPMa3iEJXd1+/X8DPu
 OfSrU4Y0XnQHJsxhqQCWUWe5BbDmuI+/7sG8q+u+u6M5/RmnCtojQ4EzB3FHAvoQtGkU
 mtb3JVLIXjr0P1U1Q6e5PmAy6eERjHZiJYB5ANErjzznFP43Suc7vh4ROE5/g2hzgpDh
 /c2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=9QGzds+IdCGonqV0kBh9pv068c001U9EacoHZjtzuCc=;
 b=fYDA+wR4/OsuWSX+h57p4qj1pRloHHnGlSmUf9LLlAyywlTkEb106QLABNRKVFJqdE
 Mn04d0u3a58qCWu2MTHnnqY2hvpkg422FxNnjpbHRX4f2Y2037wCrlZ1nVOIvc44kfR8
 5Er4t24zjcXZQ//m+y8S9IsWjRRvNqyMkaEXDlXPmIFNVKyyhnwpDXnKQrDPQmQxEiu7
 YfYEcAia1Mre6A6Ul7Kn6Aj/jncqXfw3UJ/VwDCTEwlWGvqdShNX84EuMHm2yerN2OEG
 6uYNM/B/1vhH57Nhf+hiTYaBCHDHKmCDpmojT7FO+k3xLhAP4QHC29XxWsanlTgRTrvH
 Z+5g==
X-Gm-Message-State: AOAM531DrT/Ww+Ir+04H2VoUjsEhpT4XBboh93FU4QjFxZzfQ/9+zldv
 UT2HOZFeg2UHSP3Ap2eDXKOie9eAJZXjDw==
X-Google-Smtp-Source: ABdhPJwypz3uVlVc+6ZB+fKj1Yqin2+iK2gQfMIW7cKA1xZltLU90suABwDN5gQbLZEhy04Ec/EtCg==
X-Received: by 2002:a17:90b:4b0e:b0:1c6:f499:1cc9 with SMTP id
 lx14-20020a17090b4b0e00b001c6f4991cc9mr12522327pjb.133.1648052170542; 
 Wed, 23 Mar 2022 09:16:10 -0700 (PDT)
Received: from sunil-laptop ([49.206.7.17]) by smtp.gmail.com with ESMTPSA id
 oc10-20020a17090b1c0a00b001c7510ed0c8sm7229479pjb.49.2022.03.23.09.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 09:16:10 -0700 (PDT)
Date: Wed, 23 Mar 2022 21:46:04 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: RISC-V SW Dev <sw-dev@groups.riscv.org>,
 tech-unixplatformspec <tech-unixplatformspec@lists.riscv.org>,
 isa-dev@groups.riscv.org, linux-riscv@lists.infradead.org
Subject: Public review of RISC-V UEFI Protocol Specification
Message-ID: <20220323161604.GA54531@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_091612_362014_2479C0E3 
X-CRM114-Status: UNSURE (   6.61  )
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

This is to announce the start of the public review period for
the RISC-V UEFI Protocol specification. This specification is 
considered as frozen now as per the RISC-V International policies.

The review period begins today, Wednesday March 23, and ends on Friday
May 6 (inclusive).

The specification can be found here
https://github.com/riscv-non-isa/riscv-uefi/releases/download/1.0-rc3/RISCV_UEFI_PROTOCOL-spec.pdf

which was generated from the source available in the following GitHub
repo:
https://github.com/riscv-non-isa/riscv-uefi

The specification is also attached in this email.

To respond to the public review, please either reply to this email or
send comments to the platform mailing list[1] or add issues to the
GitHub repo[2]. We welcome all input and appreciate your time and
effort in helping us by reviewing the specification.

During the public review period, corrections, comments, and
suggestions, will be gathered for review by the Platform HSC members.
Any minor corrections and/or uncontroversial changes will be
incorporated into the specification. Any remaining issues or proposed changes
will be addressed in the public review summary report. If there are no
issues that require incompatible changes to the public review
specification, the platform HSC will recommend the updated
specifications be approved and ratified by the RISC-V Technical
Steering Committee and the RISC-V Board of Directors.

Thanks to all the contributors for all their hard work.

[1] tech-unixplatformspec@lists.riscv.org
[2] https://github.com/riscv-non-isa/riscv-uefi/issues

Regards
Sunil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
