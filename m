Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65633C61DB9
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DAQQSJEV3iX3qfykhTr1Y0Id8z2UJhImJjYpIkDbyo=; b=FwdUfHEh35uXTU
	9ZmE6/5RTwANv91G49exrgWPRy3W/RQRqTRnu9dWGChEyDiKTs55CEYLukhzuTN8A/nz12E02I/SZ
	smU3SaJ+gm5z3BlgchzEgDn6N7AygILoejYTPiATOORhgw/RStZdo3A1380Q0kRqWuSL78l6Xmg5V
	tZrXw1U4T9fDcPGCfE7Rn/G+yIPTdQE4DICjP6u8do42WgMhdrtd1mv3Iq2yqwHrlGeibLh0qgKMO
	Gjp6lhRHRQbzettIgTxr+yGJy74KrhD0wZfNzHtpoo3GxvDai4Hv8FkaxT/VAvg4jeFBeiOEV0S8D
	sbp3KSMn4pGNc0ORPNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08FH-00000006akl-2pPC;
	Sat, 29 Aug 2026 01:52:35 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x08FF-00000006akS-0U5t
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 01:52:34 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2ce98cb8165so16867265ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 18:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787968352; x=1788573152; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=R3TtzVUuNLWCWg9jvIU0hv+lAZhJMxQKtFWw81fzeAYbEufl0Jc0vvbpMh2xxYsYb6
         9DunbT9rbwferQA166qzvUiUR+n9Ol1eUAaPNX7snuxajmhs/V81wE5FXM8YqsZApBPV
         HpW4+zDJs19uzBCIDH5sDaxPzxYZYfpv+yIyjUwr7R3CoQepM3mFIQh3s2AKlzyQ4gvV
         Z7fq1f6oA5SPFhtANLKW3rGURLhbiEB5sSmTz7S3mtaOhGrebiVjI96K9wEVRVM/qh+q
         eVSK0mupamwtl23VlYlFH7eOU9nz/zA2D9ljR9etH0pRxUbcMSYAJIqNn/rJOxeVWt/0
         GJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787968352; x=1788573152;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1fxs9Cuh7MABhOUaj3Dq6spYafZwoVaMo6QE7grAIU=;
        b=UdWjrFBi6ciloNKix02aklM00Gq4I3HVEvzZF/FZyHsCdJP3GJUNSCCoDmjF5SYeXp
         +iuxl4XEks70nUPFdJy2XqfS2eAJaowf/wFdmIl3KMn2oVgWIXOmjKVa2Qe/yZPsp18w
         W2p36ZwWJQHEYKFesyWEZOvvZbR7Evk1sWOfkZuAvSEmHz+nzY6QScySsN3u5v/OHLJx
         nNB+uLWljX4iDQRvvUuQ7lwyrX2TndMEYediWEFGvCNLh3kkFOqQIZtjthik3J0Wq4/g
         QoM2ji6E8L8mBlWIrh24bAyb1FtjjUDGUJHOqoEDBvjcLsMaAZ2eOc84Uf6KaLB2PeNY
         lo+w==
X-Forwarded-Encrypted: i=1; AKwUvBzRc/hhD/SIeYfED/O+0qPtOCKNX71wxUtUSOmhayT6PrXCTKWSPt4eqUMFFtlS3+O63JJv/qfYKrHsOw==@lists.infradead.org
X-Gm-Message-State: AFuF++nPQ5nIYthogSmCbD1AQ4grrhXId4l7um36iCj01sCQtTjfGGlT
	iwRwMsbTd5gFzKDXuS//r3y2ao8CrRJAv7eMuCt+Nt1z1KUyoqX7umrz
X-Gm-Gg: AYBFou2W/gRVppNmXAN4xp1wxwLjbFw45W3gOj4MojfxvV/eQc+WIdlmu55qYtThmC+
	oagRVARQNvMZS9mg9OZyXXM0gyos8/50S2K/abEXQyTj0uqVqwxZ8REfjCMoyhNRIWKpDJeizWN
	yM3dPLZWkpa/DkYh4ViU//gEUo3U3dVi0wSUFBpT2xsBqd24eWwWpCnJFfHhFf3K3cPEQ+m22gy
	yPiGEIlknuPxw+UO5VhGnJIJTzNWfoDhbGS7IM1NfbMhTi1OpnPLfTPhi7VFhdv0yzA60eLtIxG
	TdoLhgk2kbZmDZmz5bKAT4+TH3uG3vu06JRUxWlvmZbjfX2iXsbQSfqgQGprSgT1EWhILbPxXGp
	a8e/9n4sOFiIkxUeXhrN9NaA7IKKRocVvZvBvLH3cXMjoS3W29q/aBfkATTRJ7w097yZomZgnqI
	haXfB8eDf2TJSHOaM667EON1Hb4/yOQQVA+XeCug9mBhgrnjfJpHLfRzYhXjzupw67ld34PLaVZ
	wRK6C/+
X-Received: by 2002:a17:902:f68a:b0:2d3:c3b:c7cc with SMTP id d9443c01a7336-2d725df6dc7mr197429485ad.3.1787968351866;
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
Received: from hppc-archlinux.localnet ([2408:8240:c13:2170:c21d:681:ea:d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm9335864eec.23.2026.08.28.18.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 18:52:31 -0700 (PDT)
From: Yukai Wu <xiaoyewuz.ruster@gmail.com>
X-Google-Original-From: Yukai Wu <xiaoyewuz.Ruster@gmail.com>
To: =?UTF-8?B?5oWV5Yas5Lqu?= <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <skhan@linuxfoundation.org>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update arch/riscv/patch-acceptance.rst translation
Date: Sat, 29 Aug 2026 09:51:25 +0800
Message-ID: <qEGu0mcxR2u_YYmRciJGuA@gmail.com>
In-Reply-To: <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
References: <20260828061834.3645176-1-xiaoyewuz.Ruster@gmail.com>
 <14a7a290.91f.1a048b9be40.Coremail.dzm91@hust.edu.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_185233_193757_2308DF04 
X-CRM114-Status: UNSURE (   5.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRG9uZ2xpYW5nLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldyEgSSBhZ3JlZSB0aGF0ICLku4Xm
jqXlj5ciIHNob3VsZCBiZSBjaGFuZ2VkIHRvICLku4XogIPomZEiIHRvIG1hdGNoIAp0aGUgb3Jp
Z2luYWwgImNvbnNpZGVyIi4gSSdsbCBpbmNsdWRlIHRoaXMgZml4IGluIHYyLgoKSSd2ZSBhbHNv
IGFkZHJlc3NlZCBXZWlqaWUncyBzdWdnZXN0aW9uIHRvIGtlZXAgIlBhdGNod29yayIgdW50cmFu
c2xhdGVkLgoKdjIgd2lsbCBiZSBzZW50IHNob3J0bHkuCgpCZXN0LApZdWthaQoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
