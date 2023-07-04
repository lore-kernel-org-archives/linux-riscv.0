Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3719EB64DA
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x99gaI6lnD8b9pOytWd/wbxtpFl+2oFJShZVjAbsptg=; b=jU4WlbIjgO8A16
	vMdYQOx1yFmaWcSJwv/RBvpOQoWqQlrMFwZbIEWXo4lZtg6GQSVVlPss3IuVzkTrEISX9w6aMXRTj
	eTOjxD4W0TFUzMcQYG6DLlcZnWc6E/EVnYa0CkaQRVd6e1mxUzYwYIPjSc7amjf8gBD0b596Yb7ec
	l3N/Mb5ktYT5+0boDzQlqWZFs+8484QWeCrDApub1jVdBqvBEl361gGSdkpZjlbfjyChZ/nk1/m4T
	8WtmJOJTTGqFQmtjIOvG0ijUvSkCly5fCp2rKaPBiie3BLMKB2GM1kvdpz/LbQ6k1eIqbnAOMSr46
	P8aF6NZCG76FR7ykL98A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhr9-00DeEB-1e;
	Tue, 04 Jul 2023 15:22:19 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGhr6-00DeDO-0g
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 15:22:18 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-262ea2ff59dso2634857a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jul 2023 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688484134; x=1691076134;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2YfH84aYhOUVzBJ91PYNwuoKxVCBB5MOVaCTdQMEy0=;
        b=wBMMe94gIZsJ6DpQk6yi8d0pg/B40kzuLGm1+/AkC92eNaPANxBBg02XfhM4fCdL7d
         esnha/Weday37ZU93W/kCiytV4BCWPy/YWVczXH/Rb1du0mxml7VqxBRnZKdCqe3lGqY
         LoreV/EAtJdvptUSEsHVJ0rsOZ8DK87EJSA6OIB3zwPepbQ/ob4fLV408tUKmchxdWEm
         1gQnnCljX3COXqmk3rw6CAiQkCRF8kea4sDkgxI5GNPtHb+iRYkm5bRD3dNfXhUt6ZWb
         jW5dtCNgdJ0hEhp6vmb1yHUUL1LBYTCuA6sQQK/5xwpi1L/nWkYkwk71PP1dq+YYlgmA
         LFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484134; x=1691076134;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2YfH84aYhOUVzBJ91PYNwuoKxVCBB5MOVaCTdQMEy0=;
        b=g+2RxsgUejvwPACms38qUm3gI/RaQNWrvler+7RPLl88c1KLne75Wt/Cyb0QUcwnV1
         ixGETXejN+S+tUrc5esWhG0N9LtlV4jvXdB4C53acM6f72LbLINFJnCe82GbArv6Zgvk
         u7+CXzNCMuXX9oDuyW9aOJJ2p4RO0XZn3EOKvl1/huhj9sNmEvHBICbYap73KRUDc3zc
         1OxmEVT0FH+m0HE1p82iiUW6mUtndGb/mdFLpTC6LxlVezsE5OyNYik0+jqOMctvZHUh
         u/Wgbq65mt6TOrjAhxaiXR7byeW+DDhwqVJQWNn+voowI1qLoSljf3xJspq9i5y1iert
         5pqA==
X-Gm-Message-State: ABy/qLbz3uuoRHF8UoOYpmhh7B/Q6k8/MYjK0sZbt8N8kFy/4sXzTXE7
	+2rXQfyzQqch1+qbHwMoNlbe4w==
X-Google-Smtp-Source: APBJJlGSNBzHh0j7jKsh/zTZH7bW4kPewXrJeGRjJm8yNqJaVvvGK8HprTj97ZEJRG58iKb0ywEH9A==
X-Received: by 2002:a17:90a:d481:b0:263:5d25:150c with SMTP id s1-20020a17090ad48100b002635d25150cmr10407031pju.29.1688484134375;
        Tue, 04 Jul 2023 08:22:14 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id r19-20020a634413000000b005579f12a238sm15446098pga.86.2023.07.04.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:22:13 -0700 (PDT)
In-Reply-To: <20230616114357.159601-1-ben.dooks@codethink.co.uk>
References: <20230616114357.159601-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] riscv: vdso: include vdso/vsyscall.h for vdso_data
Message-Id: <168848412160.5368.3153467967300556806.b4-ty@rivosinc.com>
Date: Tue, 04 Jul 2023 08:22:01 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_082216_466708_9B892821 
X-CRM114-Status: UNSURE (   7.87  )
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


On Fri, 16 Jun 2023 12:43:57 +0100, Ben Dooks wrote:
> Add include of <vdso/vsyscall.h> to pull in the defition of vdso_data
> to remove the following sparse warning:
> 
> arch/riscv/kernel/vdso.c:39:18: warning: symbol 'vdso_data' was not declared. Should it be static?
> 
> 

Applied, thanks!

[1/1] riscv: vdso: include vdso/vsyscall.h for vdso_data
      https://git.kernel.org/palmer/c/54cdede08f2f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
