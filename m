Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAF8D0C602
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wcbEOH+cgYaaKeIDaXB/7HAuA5vtGTuclHUiBldPdYQ=; b=pQ/uydl7lDIG1R
	bskw7DYYSdvohmlaGrJdU9QfNjR5nBdpvDC/kxJb0AlUZyBg8Y0wyxDfVq+N0rGhefteooD+Ru1l+
	G2KQ0a0/8XWqVX/vnyHbAZ6AOLrL8CJPl9d0eFXcCHVYEAQVju8XdPZC643j3xGMohOZt/GUpYBDy
	masw6FZ6Ut+uM8/1Xyc/5oXkWSf6Fx47EK7R2Q+AchbgnDNoCleK6BaG3HhhWUmhF/ebjB7wkFjDR
	4m2QXYCIDMNBQcXw7lr0qusAn6RjFTawj5EyhMutyS/RACJzJDqP7byw981hQUhnNXflXAZEqwZTI
	zZXbuJHni5bGqWIeqKXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Iy7-00000003adm-31db;
	Fri, 25 Oct 2024 11:59:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IaF-00000003Wer-239g
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 11:34:24 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20cdda5cfb6so16900325ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729856062; x=1730460862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heyBNtwR5INeI/YOzN3Ric17B0+0kdCrYxxPYSiTxXo=;
        b=dDOT5+k3E6PTvJy4Kum8pnSh+MCg5O30vWPEShPh9GhKl8P+QKnwIIEhVxMyxDSzZX
         JJVaimzHZ8iYGP5to6FTdQflrPmhXSZfDAr/EiProcg7mYRIo49CF615m/YIV5gJbiAM
         FwJWbW59ibxS4fg5tc5exNCrIIsxOgqS5cu0mjtIgwecrwObgluou1fwtSm0G1ab22ww
         V5pJ+VQJeG/qL/yGWUDMrsWpgGOgfSALi3iVp2gG2uRh2RVehcgrcgiZNbvr9Fxp7aeA
         RkOGs0bApLIwqgLnnr2n8So1b5f6j6wso4COJGzlXv3MXFJYT6pgW5aRPbioes5F07Cu
         BujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729856062; x=1730460862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=heyBNtwR5INeI/YOzN3Ric17B0+0kdCrYxxPYSiTxXo=;
        b=EaCA7/4vLuILp5Y0ymBHlIZq4DFf9BuyZwtayGMjF//wkk07U6jbVTh5cTzDDnViQg
         Sj0sg9XRHpnWgIqAS8wbFPnxUqgOlQt+VxIuoOZxOjQ6O5SwoIuSmKP/LiL9GjAL/7/G
         snackNVZQcuaTXVhjmO3sgwYO4cRfgvHVAYCoGMdzG9kpRMgAM0GiaFSL20/wY0oX77J
         XyzVU/kizFZ8X2c1JENlhkSMLqhXOVj4PY4SfbEsLCh15GmuI9hxYyoAThEQLp53vxvV
         WCUfjKGQrEYnYkflj3sxx1Sdgo61c4FJWP+1Ab2T3JfOPbPa/o4+9nZJ8D7i/VI+BL+v
         MASA==
X-Forwarded-Encrypted: i=1; AJvYcCVS7Pv/crg+wAKhwsLzyCQMMpVCp4yxvA9Ct+QvnwfrKV+ITx5X5AVLI6yx0cFe2L4j5OSDBza6WUe7tg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywltript2NRzAme/nHHavXnW7YCRAdtFBrZx88n0rJgy3ziCDZ0
	lUP2UHcdGT37Qi2k/mN/r26lfVLSrCKWdGiO8G6dg/LHIaU9mvgB
X-Google-Smtp-Source: AGHT+IHPDVv5FVBaXC3fXD4MiW0j1VlKgp12lMIobfZOHpeZ1yfL+S73kRUMWayRr/+gJErPFzikKw==
X-Received: by 2002:a17:902:e883:b0:20e:5ab1:2c80 with SMTP id d9443c01a7336-20fa9de9fd5mr140128065ad.7.1729856062358;
        Fri, 25 Oct 2024 04:34:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d5d9sm7952125ad.75.2024.10.25.04.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:34:21 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: dts: Replace deprecated snps,nr-gpios property for snps,dw-apb-gpio-port devices
Date: Fri, 25 Oct 2024 19:33:55 +0800
Message-ID: <172985594069.1201275.463002763036096177.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
References: <20241022091428.477697-8-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_043423_549219_AAF517B6 
X-CRM114-Status: UNSURE (   8.45  )
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

T24gVHVlLCAyMiBPY3QgMjAyNCAxMToxNDozMCArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gc25wcyxkdy1hcGItZ3Bpby1wb3J0IGlzIGRlcHJlY2F0ZWQgc2luY2UgY29tbWl0IGVm
NDJhOGRhM2NmMwo+ICgiZHQtYmluZGluZ3M6IGdwaW86IGR3YXBiOiBBZGQgbmdwaW9zIHByb3Bl
cnR5IHN1cHBvcnQiKS4gVGhlCj4gcmVzcGVjdGl2ZSBkcml2ZXIgc3VwcG9ydHMgdGhpcyBzaW5j
ZSBjb21taXQgNzU2OTQ4NmQ3OWFlICgiZ3BpbzogZHdhcGI6Cj4gQWRkIG5ncGlvcyBEVC1wcm9w
ZXJ0eSBzdXBwb3J0Iikgd2hpY2ggaXMgaW5jbHVkZWQgaW4gTGludXggdjUuMTAtcmMxLgo+IAo+
IFRoaXMgY2hhbmdlIHdhcyBjcmVhdGVkIHVzaW5nCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gc29w
aGdvL2ZpeGVzLCB0aGFua3MhCgpbMS8xXSByaXNjdjogZHRzOiBSZXBsYWNlIGRlcHJlY2F0ZWQg
c25wcyxuci1ncGlvcyBwcm9wZXJ0eSBmb3Igc25wcyxkdy1hcGItZ3Bpby1wb3J0IGRldmljZXMK
ICAgICAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9saW51eC9jb21taXQvZDk5OTEzZTFiODBi
NTFhMDU4MDIwODM1ZTdlYTFhNDQzOTdjYjRkNwoKVGhhbmtzLApJbm9jaGkKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
