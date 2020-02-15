Return-Path: <SRS0=MNS6=4D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387BAC2BA83
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2020 11:50:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB322081E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 15 Feb 2020 11:50:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UwtPwtZl";
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="svIz3e/S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB322081E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:MIME-Version:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LLtmUB3Trtv7u/OvBqV6MxVks5/RiaQJykLLXKuG7Q8=; b=UwtPwtZlOc+S78
	xy/QDTxV9w4uOIr+AYVAYfh47/S9r3zfcedd2ActAABBx+BQW0CUf3/MKiiuFky/OxxVUF20LKmFe
	Dy7EINam3zLb/dLd9xkyWV65bqGCxP7K8wIwrpq0/gs4mDeqQckqIZScyuOZoKvVyPYT04Yv7Cx4V
	ptqXgp5fKdnbI/xySqgQ+RHclLoyrDaidBSuHrvXKB1XIue1a5oi8nR7HoWsk2RtFfXYt8LHruJvI
	5xcPhYs8BRrm9eDqGyU+AXsDpYwkniX7HpcuHwuplOdUicqr0uNp4v5URafP7IdEeq5ktC0nnqqQi
	LUYhd+Tp4cZ3d1LOMiTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2vxt-00033D-LI; Sat, 15 Feb 2020 11:50:29 +0000
Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2vxq-00031z-Un
 for linux-riscv@lists.infradead.org; Sat, 15 Feb 2020 11:50:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1581767418;
 bh=jCA+u/iWeunXisbMKKiKA03JHhtYvtZt9+PJ1WArJLs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References:
 In-Reply-To:References;
 b=svIz3e/SRwMfRYktOnp10mrv0KT3SN7Sf3QB7z7Taq7Iqod+wP9H4AozfN+WU/Xly
 RUttwDku9m4AkgE9SSl0Ut0nn7nxyLb+Lw/1f19tGsBmJnEqUDXp/D6SB8HDjyxVaP
 FK/yPv3HbAKxuJ9LT1I74K8TV9kL34hxeFjMPJus=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MfqAq-1ioYKz3qVQ-00N8Df; Sat, 15 Feb 2020 12:50:18 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] riscv: End kernel region search in setup_bootmem
 earlier
Date: Sat, 15 Feb 2020 12:49:43 +0100
Message-Id: <b11898805c2f9f01b10867a05701aa0fafeaa886.1581767384.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581767384.git.jan.kiszka@web.de>
References: <cover.1581767384.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581767384.git.jan.kiszka@web.de>
References: <cover.1581767384.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:dRJ78LiuZpsCOAaRFt2kX6CRQY/zfwNmeS/wQDiU3z1AmAFRFhs
 a7pkspN8g5TqXQti6GoOwOTcxgRVpyBAlFa2EVziRbawhY4KUUiD3I1zy4Lq8ZsWFN+e6A7
 Com3Vi66HeXM9fYCztbS55ZxjeSj1+Ty1jIUpdedhzMyzAONSnzJ3u1FDDZ5BIv8FQLimun
 ok88tzo/ZaDd94JCMqDvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h4l0FGfFSd8=:fcKAdv9BAbt2EL6f6a/gnV
 XDc+YpOCOmmpw5Jp3Vf6XlH/UWBcdQnDFV44NqM4kAc5oNlPgOkrvYcScwcoCV52QV1dy3bO9
 NlWJ/Souni9qfUD5D4XoYkd7kjuv40xQvLDPB1PP5FUmBfCsidbNwrsBoRpQADynbELRhui5D
 WLI6MwPCKxettX+mH19d5W+T2tUezhfZFdtIonKLWukREWLFUXVK9cDMY0UaM4ntnGoH/aU4Z
 aq+TKlC5SWF46s4iJhT71Ly7GRDaIsf4B3vZYNdZRHzz70fWpR4Ips/BQhwFqJrW2XFZHVUre
 zZt88wwNbgkTIWOwlVFwKOFHdeIxRlx0DbEhLvuh2zROEkKSKXcDrU5A6UzhroK/khKd+eXVC
 M6UKThz43vnyVpknsDrgAMCZTvLw2HkJXFJzIchUY20V3TdGlTx6yIPABi0+gB4V4gSspQ/2h
 K8e0en6TmHPWW9OzgikSHpRidAM0WMBxp1OpDE3wqQn2A01kSdVhPpyR/TX5twZn8zgsQFeMv
 AVpIyln9OS9KpsuK+T3zSZtmge4qRv663UYveu28/KEdxOBLTJCdtIGk8cf6uYO2FQ95Cok4I
 zoi/PZdUrgCxItKxd+LcPj+ntp0D7Iet+23K7Do4a9fKNRVX81/01GcRmjFj9kBhbaNq3zgSB
 0f3DXSQoje+FJXJkUxt3TGH0EpNlaiySAnIdz9YVLLz5dTB1TBc5Bn5tZywz9QKxVyN7eCWAg
 HP+/JB6FY6zd9MPjYbE77A50g4ntoDcoCb3+2fZTqSgPZH2ivq6wiWZ2PcUTTMn5URGye2qWt
 ukwBGnxKtJPJkPdfzpHfXqo3R23oVQnc2fVJ+/LyDmuzBGHffZ+6EfhesP9k+ayVUaCzPW0xX
 hmSqAmLgJMibFEHKXFTE//Ps4EpI7S2vRRvjvlBNZTbZTy1AqUb/g8kyJRJ0UyU8F2C56jkfN
 Zj7LRnPykC813bq+JK7Dj8wGma8aDILHJOabhx5RE+Tjw68Mjx2WP+CwK0+lRjajpK+UkrUXI
 AXALhvcd159vwoyDN2z+Ls1F/1fEHwOymLGgqXz503JaJ2aOzHYkSK5YhL7hQFGHy0Ovx5DmP
 Q8JSoBrJKe/uMtULDUyNpnHEcsmlmvWnQ/cz8SP1u1XUuxLiXVXSToJxrzLiShG4CMIp4eqBz
 zvIx6EUxxodLvTGvGG/XIjFhl/MhFoTOck8Rh9uVUvp/Z2bBNg/FbcZgUhOeuysNiLfL9vORl
 jxUgSQKNrv44U5AMB
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200215_035027_336003_C6109343 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jan Kiszka <jan.kiszka@siemens.com>

No need to look further when that single region is found.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
=2D--
 arch/riscv/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index aec39a56d6cf..a774547e9021 100644
=2D-- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -160,6 +160,8 @@ void __init setup_bootmem(void)
 			if (reg->base + mem_size < end)
 				memblock_remove(reg->base + mem_size,
 						end - reg->base - mem_size);
+
+			break;
 		}
 	}
 	BUG_ON(mem_size =3D=3D 0);
=2D-
2.16.4


