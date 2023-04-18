Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D69EC77B71
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GIeWUu7J6qAPtORZKJQVh+mBdrhv6elvHDc/gvIjJxk=; b=sg5OkEO4B5s+ID
	MD4UkCt2N0oAnndg+3PsHawQfbGivVqHZojflTC3Tx11nYOwNeHEK+XU9tYmg1Qm7cDc7pj8NPPyp
	EM6d7XyCyNeIO1/4AWQt7aeiU5Y7nxKdj14FnuKuJwzcj+SXpfRQzTVJafthMW4a7eTp+5HJDdOzV
	YJ2j8hGxEahnZcbmblvreEgAxkqkBqtDYkFX1DHIzL7ZWQ+Q9wiyZeTfrKNkNHIqQ9xQrSfVBZwRM
	H9NOXsKlJcF2KSFc067cv0oddo+oz7E5JmYJl100fvuih7WxYOn3bsJ0IrMQ4QpoyOOKL+5nsxPl8
	q6Jisu1onYiKXFGJhWvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poiPX-001cC9-07;
	Tue, 18 Apr 2023 10:18:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poiPT-001c9e-2H
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 10:18:05 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3ee6c339cceso35625e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Apr 2023 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681813076; x=1684405076;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DYl/Oz3UxWL8YEPjdztiHxLe2qdPPPEyqdO/kFl/aj8=;
        b=a678TKWgqb1Pt1vIE8NEsK8HmAbDdG3KAKO8UAIjB+tZ6nJM2CI61vM+iQj0hlVyT5
         2VPJuSwOc8igGipc+cjuik2EES+biE0lrguoi4/WYdM4boJ86unD4lxMNHiOc9FL/Nhh
         H+Sn/yMFfu7pFZ2RElVV9mJu1iw2AMlfy81Tax76E8KRcXyifWjKyuWiMs9T3n7Hx26j
         sHgX+XvMQaz46D/E/hyShD71+SUZsWfbAKR2eNw2loKGIdOfR/RlwHq7HQjpGivWCZUg
         oNVBjppShCRDUyrBRQn8zei2/Bo8ZVetuKLMP/JRKThpUbpzt85fuxd/8tUiDW6sFrnU
         na4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813076; x=1684405076;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYl/Oz3UxWL8YEPjdztiHxLe2qdPPPEyqdO/kFl/aj8=;
        b=TZRKxdbUFteRaIlCFLa3u4eVVlydU5fNJsoEyUypQe/5IWYnnwSsgLBZRa1RtrmXCN
         A7QQrvxLNSo6gM2nttjzcaiJ7Tho/YjqW0YLCikQLutA50zgf7YzoYc2bx6j3sN/SWaD
         xAilz8odxNrVmlEzkhkzSgp/aXRIII+eC4Q5fg5WRVtoOsleb2FQb7HqNSeq1v/vC0yF
         LI+Kd2+8c/ehFO7VdDY6MDlCL3cO2bWDGgtvHvGyoRtNjRMK0kpGwy05a4D4t5gxxpgu
         UBXLHG1fqkr2u82uUMMwJ5ksPTtcLojK/iw6x7drcVxcQ5oBsBLlZbbnHRf7d3IS3LCB
         ipLQ==
X-Gm-Message-State: AAQBX9dWMxdEOZxHIxTB5oC4FWQI+SFpZYI8ywa3HoOiXE7wzco1+C4X
	lC0zwVJCy8aw1FC39ZlIHmeLiP+VN91rr8SYWxJVZw==
X-Google-Smtp-Source: AKy350aOiDKrTU1YE/OnYRqS8F5jNyelOkGz358yc/LZOs1Ra+0Gr3iD1GHqLIhP7dApHsUrOZGTHLukukOhTTHcQBI=
X-Received: by 2002:a05:600c:3b8c:b0:3f1:7490:e5a4 with SMTP id
 n12-20020a05600c3b8c00b003f17490e5a4mr155593wms.6.1681813076345; Tue, 18 Apr
 2023 03:17:56 -0700 (PDT)
MIME-Version: 1.0
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 18 Apr 2023 12:17:44 +0200
Message-ID: <CANp29Y6YqPbE9Y3iQEaTwD_YAQBvsxxRE=0COVYy=gBP-USvkg@mail.gmail.com>
Subject: arch/riscv/net/bpf_jit_comp64.c build error
To: pulehui@huawei.com
Cc: linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_031803_745190_AEB03167 
X-CRM114-Status: UNSURE (   5.47  )
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

Hi Pu Lehui,

I'm writing to you regarding your following patch.

Author: Pu Lehui <pulehui@huawei.com>
Date:   Wed Feb 15 21:52:04 2023 +0800

    riscv, bpf: Add bpf_arch_text_poke support for RV64

When trying to compile the "fixes" branch of the
"git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git" tree,
syzbot gets the following error:

arch/riscv/net/bpf_jit_comp64.c: In function 'bpf_arch_text_poke':
arch/riscv/net/bpf_jit_comp64.c:691:9: error: implicit declaration of
function 'patch_text'; did you mean 'path_get'?
[-Werror=implicit-function-declaration]
  691 |   ret = patch_text(ip, new_insns, ninsns);
      |         ^~~~~~~~~~
      |         path_get

FWIW the compiler is riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1
20210110, GNU ld (GNU Binutils for Debian) 2.35.2.

Could you please take a look?

Best Regards,
Aleksandr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
