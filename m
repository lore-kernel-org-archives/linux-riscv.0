Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAEAC54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 17:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GJzIwQ7mJdktS7SxCwzCUtfRudlcKjIiw5VBx05wS4=; b=COR26ieo80KUDx
	oOm9g+Y5jcbs2ARtwGXlmaRY8DWTYVlNqpdS4B7l1l2P4wz1OMByAXioTTaBe0XfdgKn7R0YB3Me4
	T8xV0FH1XN6aG2aDAYDasFuoWvJYND6VpR9QAwqz7ITiz1zMuooQMixlX+qg+B90ZtvJtXzxiSCp1
	869MPR45kW/QO2qSboWkrMwX9ar0g/hQk5YItI4omZ7CfoBw4O7VIzyEhtyGIK/eZaeCOE9CeAhKr
	e4+C0wOLJW4sE1LharUh8+hu162MAcP8MeKSoAhujTfbceqaiiaGtI/AkTnxL/PMGyCl2O/q5K5El
	zgg+InENlcThZVTO92HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLKT-006Ibp-DE; Thu, 08 Sep 2022 17:28:41 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWLKQ-006Iad-BK
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 17:28:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id iw17so11940743plb.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Sep 2022 10:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bfLbaRY3OEI6NIyVDG7lfBiHKdWozSjwE3PfT7WX9HA=;
        b=UxJEIbohV0qzVhZT0mVn+cgfss2A2jRc4w9+kHkJ3AUSa+YbC2kfGSPUTNXy6w/Qw0
         M0o4GlG6/UUE9UPiBID4gLI30q+zJKH3P4v0ZzjDCMeQcEeccRYBu0/20o//dtryB1eV
         yklbRveRfuLzFI9+S2PUvGQOsq6WSYtZBHJUrSXIMMarbQIxiOsnjbpbjynKBdAULxJs
         rIWQ3VoSambpb1t27x3+ZnxcSUNeJysw5dyJ3soMGjybxuAFMZZOw+q8Wy24Co4xGVjG
         KrQd/vBWvCTGal67dIeHzJJNPZrEoR1qiQSgbSG1CYbOPolphFVm7ofsNsCIcLAbarKe
         +pFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bfLbaRY3OEI6NIyVDG7lfBiHKdWozSjwE3PfT7WX9HA=;
        b=J0hqarwrmqkzwfiHC7WfSgIFLfHcueqbcPAXBL83imcRIjQ9YcRu/y1EgiOy6oZtxP
         mM3WioC/S62n14XIMec3ZX5Q1Q6R6ZGq7CPzDZX67bE39dDGAjgHI2sTMAHg9wqomLaF
         PmN2KuKNzyZDB4x1+40P7yBswM1rxguHTxGHZmtsEuLu8IQTqaTdJInlkmXrtiYntmdd
         S2mDalcOi1siIlO1RkMOSQKp5Ul8Jdq3EAAjss2ZdmZUrKJxIIkzT8iiLOV5gIodKyqv
         f+Dr2vcAAb014COIHirVbMumw16p2ceWDj92wn90C+gzeN2uYJsYOMqm6SSIvIJjA9tz
         +XZg==
X-Gm-Message-State: ACgBeo1KFMzdGoQSTBvJ8IhUMuTZRKCaUJpWMm5Wifz3Udy8g35f3Q7N
	q+AYIL5rHUIYS59bDe1cJL947R3zAvjPEKH3ke8=
X-Google-Smtp-Source: AA6agR5NfjEu0ZKKTdhGPdz2qkt7hcXVSqhGJGTTdQqoE7AG6+x07aftcoV6YzNHbiXgQpFqLW9WDnoworbRbiFOLMQ=
X-Received: by 2002:a17:90b:1bc7:b0:202:52ce:a1d with SMTP id
 oa7-20020a17090b1bc700b0020252ce0a1dmr5308453pjb.110.1662658115376; Thu, 08
 Sep 2022 10:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220908170133.1159747-1-abrestic@rivosinc.com> <CANaf2scedFxwDwBYNwk-9Y_p4O7Sc62FFjZPptdZeAs4H4JGiQ@mail.gmail.com>
In-Reply-To: <CANaf2scedFxwDwBYNwk-9Y_p4O7Sc62FFjZPptdZeAs4H4JGiQ@mail.gmail.com>
From: SS JieJi <c141028@gmail.com>
Date: Fri, 9 Sep 2022 01:28:24 +0800
Message-ID: <CANaf2scD5QtgZuAXru5=uaZOkAQ_seHbJO0YKmT07DCTDLwKQw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Allow PROT_WRITE-only mmap()
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Celeste Liu <coelacanthus@outlook.com>, 
	dram <dramforever@live.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_102838_428112_E099DF46 
X-CRM114-Status: UNSURE (   6.59  )
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

> https://fars.ee/1sPb, showing *inconsistent* read results on -r- pages
> before/after a write attempt performed by the kernel.

That said, maybe prohibit mmap-ing -w- pages is not the best fix for
this issue. If -w- pages are irreplaceable for some use cases (and
hence need to be allowed), I'd suggest at least we need to re-fix the
read result inconsistency issue somewhere else despite simply
reverting the patch.

Yours, Pan Ruizhe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
