Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5923C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 05:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HrcbksP67ukCcMgHBSyu02Xfn/f228LJ8PvB7CRW7Vk=; b=BS7M/zZSwlKHCR
	/+w1a3oGzhkH8ublm4imhTaROot8SeGjzGH1MoRRe19zk6E1zMwfSBaiBHUlxK+F8Hbc11OTKGvvP
	lLvXiu0O/NjHMNcXsgKsw/wlhcZKsrKtSCJZz6nHf9qYWDE23cU38a2PH2l69r6whv6C3l6STR2Jz
	5vjyf+8fEfvekAAAWRvCNQFvCmGcVn3SBdcg3A21Fy7JX3fIAAjNeqTKh9u5AkmydO5DEX80ow7A7
	bXX4WqdCSqZ0b/jMekwxup+u7dYfj+jTzDVUqtYhJvhdvBrj0wvvmhmRmHNVfdHw0HMK2DZongOQs
	Y0QdSflq0mi4TKVvQdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phO4R-00GdnC-11;
	Wed, 29 Mar 2023 05:10:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phO4N-00Gdkn-2x
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 05:10:01 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l12so14325275wrm.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680066594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrrIoxB+zKV0UEkWODap9Ww4pQQF6XVCTKbb7wsxq9w=;
        b=RGW7BPAzQrFqvwD0TyHAZcelsSUbPUly85CojGz+IUBF8zmCAbCb8KYciS7rl3Y1Ha
         86+DjMvDX54STPJNHzOUCHOGix1k6adhqnwaupVt5swn2r+fuhcQ26kaO25qGhDx7cIr
         cjOm+De9MIKde3lbwKzubPsrex1i2a0xTiDZbLxQAnDDhwKCjFWDXsBjiishvop/eJQq
         RtsxAUcVof32GUDt77IdHVYQTl9Ef+HOGwgVwbTvOiqiyumna4EIYGRpo0o2nCBQEjBm
         oA8l9zAUkkyJZw80jxlp4HJm3VH2O41RDJJy1Hv36gaKi5rudRsqERD1XMES1PGEKzuO
         QyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680066594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrrIoxB+zKV0UEkWODap9Ww4pQQF6XVCTKbb7wsxq9w=;
        b=Qzu7Vzyq4yoGzRwcdlczX2VrfFg65R6cRgiT3lz1OvM8M49YripKHhAeygGd0Rke8c
         qXTYJJ/iGmP9cSyrEcAGggwU53j1G0YbT5WbUCH5U382v9Ielsk+YU3jxHYcyhCU85O6
         kDBv93/7MORhVvUxs4SNjkwe6KlMMRKJ3BA7IpC6lQOuKHnK3IVG/RW0uCDPdby0x87r
         ExHCAVF9DM1QOaKJ2IfSihDgocBK3QpgvNbzjKxE87ZUClrfaKVsCsPkh48kbh/FvYeo
         Ir6mIljndWl9HqpMlUAhOp2ehZxorZQPRL5Ymn/6v0vNHHv9tWaVLj679kfwB5FWSR7c
         /s2Q==
X-Gm-Message-State: AAQBX9fNZTlGfDenj+XzJTXo5hfB/No9p9DxFGSFEXe302uQYZgltryn
	/+4YJfl6dI06RADjZIUSbVzWCw==
X-Google-Smtp-Source: AKy350aemnnDJZg1tjixCU1DyyeIbsbWItubuUCQbq2D2yP+v86vrpuRBNS6XgT2PoDV795mcpn0Xw==
X-Received: by 2002:a5d:4642:0:b0:2c5:5ec7:43bc with SMTP id j2-20020a5d4642000000b002c55ec743bcmr622318wrs.18.1680066594447;
        Tue, 28 Mar 2023 22:09:54 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5307000000b002c5a1bd5280sm29161207wrv.95.2023.03.28.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 22:09:54 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v9 0/1] riscv: Allow to downgrade paging mode from the command line
Date: Wed, 29 Mar 2023 07:09:50 +0200
Message-Id: <20230329050951.66085-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_220959_953088_FA1CE2B9 
X-CRM114-Status: GOOD (  17.64  )
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

VGhpcyBuZXcgdmVyc2lvbiBnZXRzIHJpZCBvZiB0aGUgbGltaXRhdGlvbiB0aGF0IHByZXZlbnRl
ZCBLQVNBTiBrZXJuZWxzCnRvIHVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBwYXJhbWV0ZXJzLgoK
V2hpbGUgbG9va2luZyBpbnRvIEtBU0xSLCBJIGZlbGwgb250byBjb21taXQgYWFjZDE0OWI2MjM4
ICgiYXJtNjQ6IGhlYWQ6CmF2b2lkIHJlbG9jYXRpbmcgdGhlIGtlcm5lbCB0d2ljZSBmb3IgS0FT
TFIiKTogaXQgYWxsb3dzIHRvIHVzZSB0aGUgZmR0CmZ1bmN0aW9ucyB2ZXJ5IGVhcmx5IGluIHRo
ZSBib290IHByb2Nlc3Mgd2l0aCBLQVNBTiBlbmFibGVkIGJ5IHNpbXBseQpjb21waWxpbmcgYSBu
ZXcgdmVyc2lvbiBvZiB0aG9zZSBmdW5jdGlvbnMgd2l0aG91dCBpbnN0cnVtZW50YXRpb24uCgpJ
IGhhZCB0byBjaGFuZ2UgdGhlIGhhbmRsaW5nIG9mIHRoZSBjb21tYW5kIGxpbmUgcGFyc2luZyB0
byBtYWtlIHRoZQpjb2RlIHNlbGYtY29udGFpbmVkIGluIGtlcm5lbC9waS9jbWRfZWFybHkuYyB0
byBhdm9pZCBjYWxsaW5nIHRvbyBtYW55Cl9fcGkgcHJlZml4ZWQgZnVuY3Rpb25zIGZyb20gb3V0
c2lkZSB0aGlzIGZpbGUuCgpJJ2xsIHVzZSB0aGlzIGFwcHJvYWNoIGxpa2UgYXJtNjQgdG8gaGFu
ZGxlIHRoZSBleHRyYWN0aW9uIG9mIHRoZSByYW5kb20Kc2VlZGkgZnJvbSB0aGUgZGV2aWNlIHRy
ZWUgZm9yIEtBU0xSLgoKVGhpcyBwYXRjaHNldCBpcyByZWJhc2VkIG9uIHRvcDoKCkludHJvZHVj
ZSA2NGIgcmVsb2NhdGFibGUga2VybmVsCihodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtcmlzY3YvbGlzdC8/c2VyaWVzPTczNDg0NykKYmFzZS1jb21taXQtdGFnOiB2
Ni4zLXJjMQoKdjk6Ci0gRml4IG1lZGxvdyBidWlsZHMgYnkgbWFya2luZyBwaS8gbWVkYW55LCBh
cyByZXBvcnRlZCBieSBQYWxtZXIKCnY4OgotIEZpeCBMTFZNIGxkIHdhcm5pbmcgYnkgbW92aW5n
IHRoZSBzZWN0aW9uIC5pbml0LnNkYXRhIGZyb20KICBrZXJuZWwvcGkvc3RyaW5nLmMgaW50byB0
aGUgbmV3bHkgY3JlYXRlZCBzZWN0aW9uIC5pbml0LnBpZGF0YQoKdjc6Ci0gUmViYXNlZCBvbiB0
b3Agb2YgZm9yLW5leHQgd2hpY2ggaW50cm9kdWNlcyBsb3RzIG9mIGVycm9ycyAodGhhbmtzIHRv
CiAgdGhlIHBhdGNod29yayBDSSkKLSBBZGQgX19OT19GT1JUSUZZIHRvIGF2b2lkIHVuZGVmaW5l
ZCBfX3BpX2ZvcnRpZnlfcGFuaWMKLSBBZGQgYW4gYWxpYXMgdG8gb3VyIG5ld2x5IGludHJvZHVj
ZWQgc3RybGVuCi0gUmVtb3ZlIF9faW5pdCBhcyBzZWN0aW9ucyBhcmUgYWxyZWFkeSBwcmVmaXhl
ZCBpbiB0aGUgTWFrZWZpbGUKLSBJbnRyb2R1Y2UgbmV3IHNlY3Rpb24gZm9yIGtlcm5lbC9waS9z
dHJpbmcuYyB0byBxdWlldCB0aGUgZm9sbG93aW5nCiAgd2FybmluZ3MgKG9uY2Ugd2UgaGF2ZSBh
bGwgdGhlIHN0cmluZyBmdW5jdGlvbnMsIHdlJ2xsIGJlIGFibGUgdG8gZ2V0CiAgcmlkIG9mIHRo
aXMpOgoKd2FybmluZzogb3JwaGFuIHNlY3Rpb24gYC5pbml0X19idWdfdGFibGUnIGZyb20gYGFy
Y2gvcmlzY3Yva2VybmVsL3BpL3N0cmluZy5waS5vJyBiZWluZyBwbGFjZWQgaW4gc2VjdGlvbiBg
LmluaXRfX2J1Z190YWJsZScKd2FybmluZzogb3JwaGFuIHNlY3Rpb24gYC5pbml0LnNyb2RhdGEu
Y3N0OCcgZnJvbSBgYXJjaC9yaXNjdi9rZXJuZWwvcGkvc3RyaW5nLnBpLm8nIGJlaW5nIHBsYWNl
ZCBpbiBzZWN0aW9uIGAuaW5pdC5zcm9kYXRhLmNzdDgnCgp2NjoKLSBGaXggbGx2bSB3YXJuaW5n
IGJ5IGZvcndhcmQgZGVjbGFyaW5nIHNldF9zYXRwX21vZGVfZnJvbV9jbWRsaW5lCgp2NToKLSBI
YW5kbGUgbnVsbCBjb21tYW5kIGxpbmUsIFRoYW5rcyBCasO2cm4hCi0gQWRkIFJCL1RCIGZyb20g
QmrDtnJuCgp2NDoKLSBJbnRyb2R1Y2UgcGkvIGZvciBLQVNBTiB0byB3b3JrCgp2MzoKLSBNYXNz
YWdlIGNvbW1pdCBsb2cgdG8gbWFrZSBubzRsdmwgY2xlYXJlciwgYXMgYXNrZWQgYnkgQ29ub3IK
LSBBZGQgYSBub3RlIHRvIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dCByZWdhcmRpbmcgdGhlIGltcG9z
c2liaWxpdHkgdG8gdXNlCiAgdGhvc2UgcGFyYW1ldGVycyB3aGVuIEtBU0FOIGlzIGVuYWJsZWQs
IGFzIHN1Z2dlc3RlZCBieSBDb25vcgotIEFkZCBSQiBmcm9tIEJqw7ZybgoKdjI6Ci0gSG9ub3Ig
Q01ETElORV9FWFRFTkQgYW5kIENNRExJTkVfRk9SQ0UgYXMgbm90aWNlZCBieSBCasO2cm4KCkFs
ZXhhbmRyZSBHaGl0aSAoMSk6CiAgcmlzY3Y6IEFsbG93IHRvIGRvd25ncmFkZSBwYWdpbmcgbW9k
ZSBmcm9tIHRoZSBjb21tYW5kIGxpbmUKCiAuLi4vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRl
cnMudHh0ICAgICAgICAgfCAgNSArLQogYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKwogYXJjaC9yaXNjdi9rZXJuZWwvcGkvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgIHwgMzkgKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9waS9jbWRsaW5l
X2Vhcmx5LmMgICAgICAgICAgfCA2MiArKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tl
cm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICAgICAgICAgfCAgOCArKysKIGFyY2gvcmlzY3YvbGli
L21lbWNweS5TICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGFyY2gvcmlzY3YvbGliL21l
bW1vdmUuUyAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIGFyY2gvcmlzY3YvbGliL3N0cmxl
bi5TICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDM2ICsrKysrKysrKy0tCiA5IGZpbGVzIGNoYW5nZWQs
IDE1MCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFy
Y2gvcmlzY3Yva2VybmVsL3BpL01ha2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNj
di9rZXJuZWwvcGkvY21kbGluZV9lYXJseS5jCgotLSAKMi4zNy4yCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
