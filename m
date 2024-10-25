Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9E0D11718
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m7k4M0/C3zZf+RCX6PEzFVQsjoGxtzq4sd6GPbBanc4=; b=lmBPAdSKDAgtVt
	0mJ40o4zgwEsJISF2wCp3nVhGPoC5+wrx2VYOm8fUq9SwtGlupc/4o+tNtrARW1BquwnDEMgl7vf3
	Ek58tUFpSI1ICMSAjugMMupd70s0SYC0G0XUh373JHeCA/NSRtxJzuum+rzBxSNgu0yw7Lahp/OTw
	LXKIVZh22+RlLMvXzhl95rqJREvvzBKXtPD7AVf1lahqhvfy5Zen6OzWQuGrCpKq7SYO9rhl1sBiS
	Zk72dfaG9pm2QbpSpn2aizWObC4cWgkUC6kxIPmtFzpHOzLTrllcqoq/UNdTIDakpfmrRXruG/3Oc
	T/EaZtRKP0pujF6E6ALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FTy-00000002ww4-49Dm;
	Fri, 25 Oct 2024 08:15:42 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FLc-00000002vGx-25Fe
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 08:07:05 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7181885ac34so1065076a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 01:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843622; x=1730448422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCanS7lm2oIK9WyJeeAEIKg/+DUCUltSdlV8tSxgaXs=;
        b=hx12Kqty2N3ZQTP2a9SQ/Ddzo+hza2fFdqUF/BWe/Rc046O5H2Ok4ERFuX08UQABKn
         78GQsQnwsyRXt6rNJCbBMQDYRTGumKgL9oBbamc+Bpo7PaD3sg7t/dlzWShErBjqd9ou
         nPbzY08batVgZvgH2VrADKllknEOCuBDOGOq2/CNS11z6mox0MKopvGqobqz2Yh7ve5f
         lOc6W0YyNzVHPG4YhtcEeMSSQ5I6r8KuMHLIehEe840SFWYnQb4zzg/w+x3GFhN2dD5n
         Ucc3V4/h3shvf3erdKrIajCna+E4SziDZxYWHD8K9XbO9YHEl/6HM9rJOhGhEhVY3oHk
         gDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843622; x=1730448422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCanS7lm2oIK9WyJeeAEIKg/+DUCUltSdlV8tSxgaXs=;
        b=soykw7Y3BQ7nH7OgndmvIHmGGf2aFwJy4hykLTKxLREv/Bz4N63xnLJUbbgyp0lAlp
         GBcNil8K6oRaKpQbhxjGyPBHN2s7axAK8tNG+doBZ6ibsFWBRYu99c9NHkCYexO0C10c
         Djx6aIYsYDKCyPpabCZBFtJhFplbvGr+0YkvP5U/7UTvnJcK9rV/QaMXS4TsoEuMVUY5
         DxqYgax+QwP2Ehy5MFwcw+ZIcSmzLI0B9ZUsFpM9I0DgRAteFnsoG/L9opyV9e5D6C05
         JdmkxxlE+Ecu+Es7OsZF08LQUZToDIkIBNhf1bmckc2EoZWuGLX8BQ8qZ+qZOsEy8FeK
         VVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIgJN4Y+KDYa6TQEWSUkFEHap2H4JNrXq8s6yJh6nFO1j8QjcUIkMgVyFP8d6HHnf0Aw7XIt7hLIPmJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrjQn5DIpGozCFAewA13SFf4TTdpiHsA0qKQe+Myv8VpX9MUKN
	DSflcA5jQYymJIzBRlJq4DqNUfaFenwc8U+tUVUfHZOZTXMyxw3Z
X-Google-Smtp-Source: AGHT+IEWw+CFqp1TrLaz2UZqvWaNMZU4mMUog4jCovrgVt4urJ8rzGiEs9L4ZK07ucQAa4zt0NSGNA==
X-Received: by 2002:a05:6870:c0d4:b0:270:276d:fb54 with SMTP id 586e51a60fabf-28ced2eeec4mr4850317fac.21.1729843622484;
        Fri, 25 Oct 2024 01:07:02 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29035d20d70sm178319fac.8.2024.10.25.01.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:07:01 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: [PATCH v5 0/3] pwm: Add pwm driver for Sophgo SG2042
Date: Fri, 25 Oct 2024 16:06:52 +0800
Message-Id: <cover.1729843087.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_010704_596398_9F8F90BD 
X-CRM114-Status: GOOD (  12.00  )
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

RnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+CgpBZGQgZHJpdmVyIGZv
ciBwd20gY29udHJvbGxlciBvZiBTb3BoZ28gU0cyMDQyIFNvQy4KClRoYW5rcywKQ2hlbgoKLS0t
CgpDaGFuZ2VzIGluIHY1OgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMx
LgoKICBVcGRhdGVkIGRyaXZlciB0byBhZGQgcmVzZXRzIHByb3BlcnR5IGZvciBwd20gY29udHJv
bGxlciBub2RlIGFzIHBlcgogIHN1Z2dlc3Rpb24gZnJvbSBJbm9jaGkuCgpDaGFuZ2VzIGluIHY0
OgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTItcmMxLiBZb3UgY2FuIHNpbXBs
eSByZXZpZXcgb3IgdGVzdAogIHRoZSBwYXRjaGVzIGF0IHRoZSBsaW5rIFs0XS4KCiAgVXBkYXRl
ZCBkcml2ZXIgdG8gc2V0IHByb3BlcnR5IGF0b21pYyBvZiBwd21fY2hpcCB0byB0cnVlIGFzIHBl
ciBzdWdnZXN0aW9uCiAgZnJvbSBTZWFuLgoKQ2hhbmdlcyBpbiB2MzoKICBUaGUgcGF0Y2ggc2Vy
aWVzIGlzIGNhdGNoZWQgdXAgd2l0aCB2Ni4xMi1yYzEuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBv
ciB0ZXN0CiAgdGhlIHBhdGNoZXMgYXQgdGhlIGxpbmsgWzNdLgoKICBBZGQgcGF0Y2ggIzMgZm9y
IGR0cyBwYXJ0IGNoYW5nZS4KCkNoYW5nZXMgaW4gdjI6CiAgVGhlIHBhdGNoIHNlcmllcyBpcyBi
YXNlZCBvbiB2Ni4xMS1yYzYuIFlvdSBjYW4gc2ltcGx5IHJldmlldyBvciB0ZXN0IHRoZQogIHBh
dGNoZXMgYXQgdGhlIGxpbmsgWzJdLgoKICBGaXhlZCBmb2xsb3dpbmcgaXNzdWVzIGFzIHBlciBj
b21tZW50cyBmcm9tIFlpeHVuIExhbiwgS3J6eXN6dG9mIEtvemxvd3NraQogIGFuZCBVd2UgS2xl
aW5lLUvDtm5pZywgdGhhbmtzLgoKICAtIFNvbWUgbWlub3IgaXNzdWVzIGluIGR0LWJpbmRpbmdz
LgogIC0gZHJpdmVyIGlzc3VlcywgdXNlIG1hY3JvcyB3aXRoIG5hbWUgcHJlZml4IGZvciByZWdp
c3RlcnMgYWNjZXNzOyBhZGQKICAgIGxpbWl0YXRpb25zIGNvbW1lbnRzOyBmaXhlZCBwb3RlbnRp
YWwgY2FsY3VsYXRpb24gb3ZlcmZsb3cgcHJvYmxlbTsKICAgIGFkZCAuZ2V0X3N0YXRlKCkgY2Fs
bGJhY2sgYW5kIG90aGVyIG1pc2NlbGxhbmVvdXMgY29kZSBpbXByb3ZlbWVudHMuCgpDaGFuZ2Vz
IGluIHYxOgogIFRoZSBwYXRjaCBzZXJpZXMgaXMgYmFzZWQgb24gdjYuMTEtcmM2LiBZb3UgY2Fu
IHNpbXBseSByZXZpZXcgb3IgdGVzdCB0aGUKICBwYXRjaGVzIGF0IHRoZSBsaW5rIFsxXS4KCkxp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MjU1MzY4NzAu
Z2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gWzFdCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MjU5MzE3OTYuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRs
b29rLmNvbS8gWzJdCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2Nv
dmVyLjE3MjgzNTU5NzQuZ2l0LnVuaWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gWzNdCkxpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L2NvdmVyLjE3MjkwMzczMDIuZ2l0LnVu
aWNvcm5fd2FuZ0BvdXRsb29rLmNvbS8gWzRdCi0tLQoKQ2hlbiBXYW5nICgzKToKICBkdC1iaW5k
aW5nczogcHdtOiBzb3BoZ286IGFkZCBQV00gY29udHJvbGxlciBmb3IgU0cyMDQyCiAgcHdtOiBz
b3BoZ286IGFkZCBkcml2ZXIgZm9yIFNvcGhnbyBTRzIwNDIgUFdNCiAgcmlzY3Y6IHNvcGhnbzog
ZHRzOiBhZGQgcHdtIGNvbnRyb2xsZXIgZm9yIFNHMjA0MiBTb0MKCiAuLi4vYmluZGluZ3MvcHdt
L3NvcGhnbyxzZzIwNDItcHdtLnlhbWwgICAgICAgfCAgNTggKysrKysrCiBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSAgICAgICAgfCAgIDkgKwogZHJpdmVycy9wd20vS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvcHdtL01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3B3bS9wd20tc29w
aGdvLXNnMjA0Mi5jICAgICAgICAgICAgICAgfCAxOTQgKysrKysrKysrKysrKysrKysrCiA1IGZp
bGVzIGNoYW5nZWQsIDI3MiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9zb3BoZ28sc2cyMDQyLXB3bS55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wd20vcHdtLXNvcGhnby1zZzIwNDIuYwoKCmJhc2Ut
Y29tbWl0OiA5ODUyZDg1ZWM5ZDQ5MmViZWY1NmRjNWYyMjk0MTZjOTI1NzU4ZWRjCi0tIAoyLjM0
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
