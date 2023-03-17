Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957E2C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JcH1PIBz5GwPbBt718ZmH4SBhSZqG4eW7kbBifwES6s=; b=YqxpkDN2k0BKOE
	mmbrvtkk53FlpB0bl+1llKQirkd+iO5pjOeIGhza/GqRkEsdKi0re5gojV76RLUFLZLictgsvbFdL
	0ENN2eM9bNOJovnDxhilrMHNqgFSEqk/cGGeN7Nv7pmNYNrPL84S3dYqt3NvpGE+cc3gktRHZ12Nf
	uuKhwF1pSn21TGmwwFuy8u3gfNPvZ5jG8mnr4CEgGCCT2M2pRqCpl2OxNUVwX1DEH4Qpyx6VJJF1C
	w4baJpyPzH7RhpekIvqk743I7w/SOdm6IjzhIX92lvbRVw28uiHRERv8g9/pQ7OvzwVB2N7MFugXD
	7RbVIDCKTfY9TDO1MZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Kq-0024I3-0p;
	Fri, 17 Mar 2023 11:33:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8Kg-0024Ej-2u
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:33:22 +0000
Received: by mail-ed1-x52c.google.com with SMTP id cy23so18995151edb.12
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1679052789;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yQ9K6P7i+jvFreJ1ATNejSYxKdKOAxPSQW/y/Q0TXmA=;
        b=t78FWCdKObt7aRVDIrm3u3h4+YzFzy9nr8FSPqgqr5CS5PNRP7wthj8rpT5eR0rvxs
         YkJiondQuPYHOu5E8l0xv3FjekteWCwFDbkU58WE7midnYjzK7hshdLr/IvRXkpF7bq9
         ygLoM4bQ8ZyutHqPApW3zKICS2wmlYTa/n8+F7NwogpIKACPQQHwtWWQLTajzNSDyGkn
         HYNyzbx23+6oy0fiKvjP/cl/NHM70HEaoAPApbUN6gxHarCHi1KApAMQUdqJPrHGauCG
         S1dUxUH6OBaEKUp3EOUhhaCmAg9AUNYn8Y6mUAie9C+XDmvntO0qXQ5rZPTwZg8q4pDj
         eibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052789;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQ9K6P7i+jvFreJ1ATNejSYxKdKOAxPSQW/y/Q0TXmA=;
        b=wrVQLCBZ5UU2Uf+3lESISdNxqmwETCqIEoyfuChwlHMENvETgUiu8tqSUn1RNqppk0
         mECwUCeStXX1BDU0TC4C7br2mbwG6//EX8y2pteAng+jh9Oy0mPNjsc8DoNNGYA1O3TK
         0XQky9L0s+tJh2H8qr6K+vfgNB/Cexk/p1rS7O5baIOAJ2GRoLgo1JD+hDlKqsUII4Pl
         556CVWWYvSeiNxkrX7bZMzccYR31Jtw6kFPjkkeJ0s9mX8JDhxHmOX2QpIfIbI7HqRoy
         wmRzyHwgfuB4S7KP+NH37OABrGcN5Y/QvEoegeLYa20bq2lJxEJT14gU8DeEt6LO62is
         w4iQ==
X-Gm-Message-State: AO0yUKUFX3tCd2Q/ipv5vJmaK2XWtU0oqU9nMP4j+N8Sy/Ct/vMR1c/R
	WajxyEOeM1H/yIxxfYUH7yNg4UAdDmWHiBwNNkF6Zw==
X-Google-Smtp-Source: AK7set8GwJca1C5PPnQh4fRL74jDgwGSiutiqOWceaQ21v4CcPqAZLNGle/zPBe2F5T11d53xWGsltnp8i+e8WHVtmg=
X-Received: by 2002:a17:907:36e:b0:8b1:3d0d:5333 with SMTP id
 rs14-20020a170907036e00b008b13d0d5333mr7093608ejb.13.1679052789335; Fri, 17
 Mar 2023 04:33:09 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Mar 2023 17:02:57 +0530
Message-ID: <CAAhSdy320bsv7=EBLcdiXyJcO6NWUFK9_XUvwF_KvFF8v91RpA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.3, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043315_133493_4972EE9B 
X-CRM114-Status: UNSURE (   4.37  )
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

Hi Paolo,

We have one KVM RISC-V fix for 6.3:
1) Fix VM hang in case of timer delta being zero

Please pull.

Regards,
Anup

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.3-1

for you to fetch changes up to 6eff38048944cadc3cddcf117acfa5199ec32490:

  riscv/kvm: Fix VM hang in case of timer delta being zero.
(2023-03-17 13:32:54 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.3, take #1

- Fix VM hang in case of timer delta being zero

----------------------------------------------------------------
Rajnesh Kanwal (1):
      riscv/kvm: Fix VM hang in case of timer delta being zero.

 arch/riscv/kvm/vcpu_timer.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
