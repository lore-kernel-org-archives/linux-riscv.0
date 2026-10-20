Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5E60A2617
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=16ilKmtZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e3D2wSaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELcTS786YlCfWYJQHfHxLrU6qypasDwzo2MPXUoMeV0=; b=16ilKmtZ1tyRFz
	3TZ2fTXF2Be8RVLH18OpoDVscg8NeUJjr3MIe1FMPb0o3a9RBj5dfx+6ymyiJYLMImHFUWSy8lm3z
	ZxG2HxSL/y5cenY4kjH+8gNPqJl7vF1sgUHjivzi/rQuR5pTE1C5/8WdcK/Fa8cldffFCzHgDJuvz
	iwy31MwQfEXmp0NDQw7hlrDrHTBZ1Sagyzu06LzAxkoFzqaWl61m8Dj3NBcvrkha+IXSRbmMifVxM
	A+ltLFPiKZ8jB/XtpkpkXG5/NpWPdRgOgy/n1Pk1VX9mV4Pkg6imqCmsE3QcTbQfzBzqGwejOtc6l
	1DjJpGY+CX1fagLXIqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERG-0000000AQLy-00Gu;
	Tue, 20 Oct 2026 18:19:54 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJERD-0000000AQJm-3Kk9
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 18:19:52 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-366421dc8ebso1396209eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520391; x=1793125191; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=e3D2wSaXQ5/BNJSHfqOBbWUdTbpYf/AO5iGsl+GowT4sQVP2NncP8JUUb6+BZCyIYM
         nN9ppp0qLfvaQN9MKV3ZYkyttXYB3Tcuc+T9H/JWtnpQ+Bl/NyDpJqZXmM2h6aIWtejX
         reSbBMoCteAFpsizAxfQIEsZKD4Y9tT4K38tw6cJlK6hy1oFZHqWOEWpDcx5/tFV5R1T
         PGBh8SNvibxB7BI80/D+GR/FmQ65LC/w2p5/b34vWBOLPjCAFytn+Pxx65fjGHzmOK36
         MS2wl6qjtk5fwIsQg7ifC3Q3ZjAlgA68ujUUUYpMC6JbQAPS+cQwaNeysQWKRTDHnlVk
         D1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520391; x=1793125191;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FXROYGPQWGFmqEgtHLT36Aa9jNEnUAaU6PbR3cRnznM=;
        b=xDUfbmwdKFNK6sSrIdJWA3j8isLVC9utv5TJsgxx21/yvySgKXr+CXsxNhe4oQBRvd
         MbLu21/rSaF/xeRApmhf8veCW+srH4STCTgmLlcweCtZtYnCHFvO1SsvsMbqnLuPDJJq
         gBK2q8ci4FuZgGpRQtE2LoO6/RefCjTRlqnf4uIR8J4Hfxpwq1Gc7VkwGOO0JmqyjeG7
         KuGTPBMDIRGnwROUcBhpkHQO+mh3jnTUfCEIOWq0beryGqqMxCnQfDDJIAvU0TYadIXW
         cR0+SyIAVwz5gycEgbpsybAVwmJ3R3B/IoeBOSbtrdUb/OP0lNNp8PerLnE5UegU85Vr
         TEjA==
X-Forwarded-Encrypted: i=1; AKwUvBylSztuViI4sVjw5gRQ1ahA/hOSUNIIM11KUiO127ZtykBomef/Ody3cotOdlHK/ZpCeQMcMq8ahKVs+A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLURtDQEx9tYPaulvDKLad8mWNkR+Sc8THx+1CZO7kM7Wnuthxf
	3mzVPuB+k73bgpYqs8VSSz+00J0m9jmXUmU/BO6HIphhJNqJOl18AtpS
X-Gm-Gg: AYBFou2L8FFzkLMAyEoKlTxpfkX9dM8oJU8tnhObTjxl1CKKNQewzR4pifczRRGcBk6
	4Vy0JjqI5HfP4T4L8Zx1Jm4VOvkj9B9DtXd9Q9+9C0ThNh8o94lmXEWOrO0iVz9l29pFMr5WDel
	NruCbh0L9ajmgFajttd2q6grau0XhO4f8yVr/J0jSgV1Y2UBB+fMJ0LeDZt+5INiA92OkzrI1Sy
	1lKxbuG8EnBxiFQytcJR99Fvd1LQdgp6fsfJ+KFrDvYPbUvwHGVZEWEv8xU14OJkVjLWX8W8xUK
	qbI425S6G4tcN7pVBVWFj0Ht+8jdKBMEZ0zmLvGwStlpeTYjM7DQz4SchIuHsurzBqNE6goNOhW
	n9cnmLcKXOyix4szPVgAJ7tItv3i6CBwtgTm+kVZg/vAALDsmKVw6nUGAMmG7ZPZD1h3lgNue7v
	JXzzXHyrY4C4sWskRhUzn3JUomLfVsqNbc6y6a0+PpJWhz6ZJOc+Hfy57iht3grwIpO1xseFQk/
	lo=
X-Received: by 2002:a05:7301:160a:b0:366:6c79:212b with SMTP id 5a478bee46e88-3666c792450mr2214856eec.25.1792520390778;
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:50 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] riscv/shstk: release shadow stack on failed fork
Date: Tue, 20 Oct 2026 15:19:31 -0300
Message-ID: <639e84e5294f48e6b3d595161c42ebb7b89557ce.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_111951_850097_F64A11EF 
X-CRM114-Status: GOOD (  14.85  )
X-Spam-Score: -0.1 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Y29weV90aHJlYWQoKSBtYXBzIGEgc2hhZG93IHN0YWNrIGZvciBhIENMT05FX1ZNIGNoaWxkIGFu
ZCBjYW4gc3RpbGwKcmV0dXJuIDAuIEEgbGF0ZXIgY29weV9wcm9jZXNzKCkgZmFpbHVyZSwgaW5j
bHVkaW5nIGNsb25lMygpCkNMT05FX1BJREZEIHdoZW4gcHV0X3VzZXIoKSBmYWlscywgZ29lcyB0
aHJvdWdoCmJhZF9mb3JrX2NsZWFudXBfdGhyZWFkIGFuZCBleGl0X3RocmVhZCgpLiByaXNjdiBk
aWQgbm90IHNlbGVjdApIQVZFX0VYSVRfVEhSRUFELCBzbyB0aGF0IGZyZWUgd2FzIGEgbm8tb3Au
IHNoc3RrX3JlbGVhc2UoKSBhbHJlYWR5CmRvY3VtZW50cyB0aGlzIGNhbGwuIE5vcm1hbCB0YXNr
IGV4aXQgcmVhY2hlcyBpdCB0aHJvdWdoCmRlYWN0aXZhdGVfbW0oKSwgd2hpbGUgdGhlIGZhaWxl
ZC1mb3JrIHBhdGggZGlkIG5vdC4KClNlbGVjdCBIQVZFX0VYSVRfVEhSRUFEIGFuZCBjYWxsIHNo
c3RrX3JlbGVhc2UoKSBmcm9tCmV4aXRfdGhyZWFkKCkuIFRoZSBoZWxwZXIgYWxyZWFkeSByZWZ1
c2VzIGEgZGlmZmVyZW50IG1tIGFuZCBhCmNsZWFyZWQgYmFzZSwgc28gQ0xPTkVfVkZPUkssICFD
TE9ORV9WTSwgYW5kIGEgc2Vjb25kIGNhbGwgYWZ0ZXIKZGVhY3RpdmF0ZV9tbSgpIHN0YXkgbm8t
b3BzLgoKRG8gbm90IGZyZWUgd2hlbiBzaHN0a19hbGxvY190aHJlYWRfc3RhY2soKSBmYWlscy4g
VGhhdCBlcnJvcgpyZXR1cm5zIGZyb20gY29weV90aHJlYWQoKSB3aXRoIHRoZSBpbmhlcml0ZWQg
cGFyZW50IGJhc2Ugc3RpbGwgaW4KcGxhY2UsIGFuZCBjb3B5X3Byb2Nlc3MoKSBza2lwcyBleGl0
X3RocmVhZCgpIG9uIHRoYXQgcGF0aC4KClRhc2tzIGNyZWF0ZWQgdGhyb3VnaCB0aGUgYXJncy0+
Zm4gcGF0aCAoa2VybmVsX3RocmVhZCgpLApjcmVhdGVfaW9fdGhyZWFkKCksIGFuZCBzaW1pbGFy
KSBkbyBub3QgYWxsb2NhdGUgYSB1c2VyIHNoYWRvdwpzdGFjayBpbiBjb3B5X3RocmVhZCgpLiBU
aGV5IHN0aWxsIGluaGVyaXQgdHJhY2tpbmcgdmlhCmFyY2hfZHVwX3Rhc2tfc3RydWN0KCksIGFu
ZCB3aXRoIENMT05FX1ZNIGEgbGF0ZXIgZmFpbGVkCmNvcHlfcHJvY2VzcygpIHN0aWxsIHNoYXJl
cyB0aGUgY2FsbGVyJ3MgbW0sIHNvIHNoc3RrX3JlbGVhc2UoKSdzCm1tIGNoZWNrIGRvZXMgbm90
IHNhdmUgdXMuIENsZWFyIHRoYXQgdHJhY2tpbmcgd2l0aApzZXRfc2hzdGtfYmFzZSgpLgoKRml4
ZXM6IGZkNDRhNGE4NTUxNiAoInJpc2N2L3Noc3RrOiBJZiBuZWVkZWQgYWxsb2NhdGUgYSBuZXcg
c2hhZG93IHN0YWNrIG9uIGNsb25lIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgpBc3Npc3RlZC1ieTogTExNClNpZ25lZC1v
ZmYtYnk6IEl2w6FuIEV6ZXF1aWVsIFJvZHJpZ3VleiA8aXZhbnJ3Y20yNUBnbWFpbC5jb20+Ci0t
LQogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgIHwgIDEgKwogYXJjaC9yaXNjdi9rZXJuZWwv
cHJvY2Vzcy5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlz
Y3YvS2NvbmZpZwppbmRleCA1ODc0Y2EzMGY0ZjYuLjc2MzVmOGNiMDM5NyAxMDA2NDQKLS0tIGEv
YXJjaC9yaXNjdi9LY29uZmlnCisrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwpAQCAtMTY5LDYgKzE2
OSw3IEBAIGNvbmZpZyBSSVNDVgogCXNlbGVjdCBIQVZFX0ZVTkNUSU9OX0dSQVBIX0ZSRUdTCiAJ
c2VsZWN0IEhBVkVfRlVOQ1RJT05fVFJBQ0VSIGlmIEhBVkVfRFlOQU1JQ19GVFJBQ0UKIAlzZWxl
Y3QgSEFWRV9FQlBGX0pJVCBpZiBNTVUKKwlzZWxlY3QgSEFWRV9FWElUX1RIUkVBRAogCXNlbGVj
dCBIQVZFX0dFTkVSSUNfVElGX0JJVFMKIAlzZWxlY3QgSEFWRV9HVVBfRkFTVCBpZiBNTVUKIAlz
ZWxlY3QgSEFWRV9GVU5DVElPTl9BUkdfQUNDRVNTX0FQSQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvcHJvY2Vzcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCmluZGV4IDdj
YzVhNmE1YzAyMC4uYjliNzY1MjY0Y2M4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCkBAIC0xMiw2ICsxMiw3
IEBACiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4K
ICNpbmNsdWRlIDxsaW51eC9zY2hlZC9kZWJ1Zy5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rh
c2suaD4KICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNrX3N0YWNrLmg+CiAjaW5jbHVkZSA8bGlu
dXgvdGljay5oPgogI2luY2x1ZGUgPGxpbnV4L3B0cmFjZS5oPgpAQCAtMjEzLDYgKzIxNCwxNiBA
QCB2b2lkIGFyY2hfcmVsZWFzZV90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaykK
IAkJcmlzY3Zfdl90aHJlYWRfZnJlZSh0c2spOwogfQogCit2b2lkIGV4aXRfdGhyZWFkKHN0cnVj
dCB0YXNrX3N0cnVjdCAqdHNrKQoreworCS8qCisJICogc2hzdGtfcmVsZWFzZSgpIGRvY3VtZW50
cyB0aGlzIGNhbGwgZm9yIGEgZmFpbGVkIENMT05FX1ZNCisJICogY2xvbmUuIGNvcHlfcHJvY2Vz
cygpIHJlYWNoZXMgaXQgb25seSBhZnRlciBjb3B5X3RocmVhZCgpCisJICogcmV0dXJucyAwOyBk
ZWFjdGl2YXRlX21tKCkgZG9lcyBub3QgcnVuIG9uIHRoYXQgcGF0aC4KKwkgKi8KKwlzaHN0a19y
ZWxlYXNlKHRzayk7Cit9CisKIGludCBhcmNoX2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19z
dHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tfc3RydWN0ICpzcmMpCiB7CiAJZnN0YXRlX3NhdmUoc3Jj
LCB0YXNrX3B0X3JlZ3Moc3JjKSk7CkBAIC0yNjEsNiArMjcyLDE1IEBAIGludCBjb3B5X3RocmVh
ZChzdHJ1Y3QgdGFza19zdHJ1Y3QgKnAsIGNvbnN0IHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJncyAq
YXJncykKIAkJcC0+dGhyZWFkLnNbMF0gPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbjsKIAkJcC0+
dGhyZWFkLnNbMV0gPSAodW5zaWduZWQgbG9uZylhcmdzLT5mbl9hcmc7CiAJCXAtPnRocmVhZC5y
YSA9ICh1bnNpZ25lZCBsb25nKXJldF9mcm9tX2Zvcmtfa2VybmVsX2FzbTsKKwkJLyoKKwkJICog
VGFza3MgY3JlYXRlZCB0aHJvdWdoIHRoZSBhcmdzLT5mbiBwYXRoIGRvIG5vdAorCQkgKiBhbGxv
Y2F0ZSBhIHVzZXIgc2hhZG93IHN0YWNrIGhlcmUuIENsZWFyIGluaGVyaXRlZAorCQkgKiBhbGxv
Y2F0aW9uIHRyYWNraW5nIHNvIGEgbGF0ZXIgZmFpbGVkIGNvcHlfcHJvY2VzcygpCisJCSAqIGNh
bm5vdCByZWxlYXNlIHRoZSBjYWxsZXIncyBzdGFjayB3aGVuIHRoZSBtbSBpcworCQkgKiBzdGls
bCBzaGFyZWQgKENMT05FX1ZNKSwgYXMgd2l0aCBrZXJuZWxfdGhyZWFkKCkgYW5kCisJCSAqIGNy
ZWF0ZV9pb190aHJlYWQoKS4KKwkJICovCisJCXNldF9zaHN0a19iYXNlKHAsIDAsIDApOwogCX0g
ZWxzZSB7CiAJCS8qIGFsbG9jYXRlIG5ldyBzaGFkb3cgc3RhY2sgaWYgbmVlZGVkLiBJbiBjYXNl
IG9mIENMT05FX1ZNIHdlIGhhdmUgdG8gKi8KIAkJc3NwID0gc2hzdGtfYWxsb2NfdGhyZWFkX3N0
YWNrKHAsIGFyZ3MpOwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
