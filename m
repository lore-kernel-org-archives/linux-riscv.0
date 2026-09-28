Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526CACA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O9HG3eecHoYF2Ch0hmQhsHLvWyRGCAEAtCqOjV8Z970=; b=bMCRdL9GSt4QmO
	cSDkhbwKO6FT7VnL1124epXwytA7MH+FgF0az4HvpyIopl1O/LAorlj9BgG2qoZGtBuwBkhroBDuH
	WoE0ApCs0g+j7xFQ2KwHuOnQIOArn2AIacqP8dSJ0fl9uS/BQFam9ihvXLzvrliKDfFG2Z5TMh0Xv
	gVi3IkKSuYdiY01Do2gE3B+Nw2VZjhFfvyWda49wOq/wJcNTrnfWFBLNCLWUv1HXai+OiVZJMrkpT
	YFA3jVUrJwSLFdUPq1nYQuePV2LVf9J//TIZgBnYhMyKjG+CZktcS3Xvc8vo83cxqaxnFZkLzomht
	mrxTc0JANbqDVnjsEtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKg2-00000001riz-1TFP;
	Mon, 28 Sep 2026 23:22:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKfz-00000001riG-1jqI
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
	b=WeICTunBNws7iD7oKH6lDoUqBffETOWfZkR9hXoU4waWjHWNeIdv3TYywJJI5qw/ZEWoR0
	rhBnH1+XLajpXVpfpXR0yg4fUxKCq6vsTiUl6w7ee9JBNPVI8QKHhWIaX+2QjiGbjg3iqB
	u2C4613inPFOqXrPhDGAZKxNBsnEpTU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-gFiWtU11Pmq9fgQ-w2Qk8w-1; Mon, 28 Sep 2026 19:19:13 -0400
X-MC-Unique: gFiWtU11Pmq9fgQ-w2Qk8w-1
X-Mimecast-MFC-AGG-ID: gFiWtU11Pmq9fgQ-w2Qk8w_1790637553
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-88322409239so52402527b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 16:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637553; x=1791242353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1L37AvZaZESgc3kaNIXv7EdbpEkOBgUu914+Tx8mGHA=;
        b=mHFM4IJtRwzBUkXV8EFA9p3yiaxbb/zS3+dv9EPYUwMMgwitZ4msvGl917m2VQOtY8
         Bni7h2FjiC+aYC+mF2IU2/4nvBZR9jWYCg2EEGsWAqJtIDnfe5riCVoHllZS0jKJ90d9
         FTTt2z1IjKhyqA9zBdJP10GPy7PCUwqwhWXOrJ00UQMLLdIq6ZL6aWxRt2zaWlEfVxP/
         TSlh0L9MCIveNX93HHPTr4mZox1Y8aXRiQZfHIxABjFf4onK+OhqMJdQ0+1KQL+T3VTz
         EcYiIJULexOTkvSRJJIQsAcFK3WQDpysVDXKp5xeMK40x3U1VJjlqu9FBqwYwp2AMdKE
         3UKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVwtkibutfbL3hduRIvdMfA9tI2XzyRtZfnydLPE+h1KK1OmAU3amkiiNYMC2w6g6PQU4LT43Qp0oWjQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJM2XJ7boOQJKi3XDa9gYdCHAPqIg0jdGtYoVt9ifCv4Y9Hv5+F
	RcuWzgoBLNAnbjaFl9xcVUSRs5Z0YQiVK/hsRoy7zMOreUruLAPYXFuRdMvMbHyPPxRvwQR7keZ
	B6Q7+Ubn9wPNwLiTij8upgol5lYCjQOaMJYqTS3B85BuSs1OapQ/yJ99CKxAwLGKtEnPLOQ==
X-Gm-Gg: AYBFou35YgRhkQt7qKzDMpr6UhU9ORxoUIzjoZbE8q59Y8pOgijqkxiiVW6NzCcEYM6
	CWuKrkK/d1q/JgcYLL7SHHx6IGm8sExWqWRv5/xU0/qW8FdQP8I8tJu603gf91vuSN9BG72K/ew
	y4xlI6o+XvYdYWrxnTSj+ijDSys8jJsu13iPsI4fjfAtuUkU2j4tGUiUMTmbIl3fhvvUGLDYooD
	CgJDgVe8uyHqIV2coirRqEvzTMzmCb46Ak3LDN5PcyN7f4dydzJt+QPApB/2o4m+Fl/Pnkipluz
	26ruxkvVMpaYz7hZTIdJH3OVFwWvJx5m3GQz5rvRVQAGrEGAn+cYSA==
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038847b3.13.1790637552706;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c9:b0:8a9:9a2e:e34f with SMTP id 00721157ae682-8a99a2eeef4mr35038647b3.13.1790637552245;
        Mon, 28 Sep 2026 16:19:12 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:10 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Mon, 28 Sep 2026 19:18:03 -0400
Message-ID: <20260928231807.1757995-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JCBNJPDDjMXESvcOIkr2sGCg1f6xfAV_bw6xyYCarb0_1790637553
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162227_531535_9421C187 
X-CRM114-Status: UNSURE (   9.23  )
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

This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.

The USB Type-C DRD port is not enabled here because the necessary
drivers have not yet been posted.

This is based on spacemit/dt-for-next. The USB patch depends on [1] and
the PCIe patch depends on [2], which in turn depends on [3] and [4].

[1] https://lore.kernel.org/spacemit/20260928205012.3689405-1-aurelien@aurel32.net/
[2] https://lore.kernel.org/spacemit/20260727094726.890179-1-inochiama@gmail.com/
[3] https://lore.kernel.org/linux-phy/20260923023304.78428-1-inochiama@gmail.com/
[4] https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/

James Morris (1):
  riscv: dts: spacemit: k3-com260: keep dldo4 enabled

Jennifer Berringer (3):
  riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
  riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
  riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes

 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 122 ++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi   |   1 +
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  |  33 +++++
 3 files changed, 156 insertions(+)


base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
prerequisite-message-id: <20260727094726.890179-1-inochiama@gmail.com>
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
