Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD6C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BeSJ55Rd04wlAIF9LJpOGED1DINJ/dssI/lQNhgQGmA=; b=DhgpA/cIqqFfL0
	nGa+QqMiVGonFYHOvw5NT8JNfZFQgQVcIkR77fzecpqHef4zt6JpOyI8PqR+30IbpqtdRApS8fG3A
	/QzmNE0IJYM/Gpa+QG9g4h1U8ExXGc5M/YSzDMPXHCB9JNrWUxpNbMgDasgo2sHUZ/KClBVbdd/xc
	Gonw7naPhDqBuEEEF7dC/toLPYQ1fQ5lDPGEs/KKM7/hK0rvfnzcn15cFfPtKEjSt1t5I9IxByG9Q
	a+w5Cnh1T3IJkLPZQnPVTUWkjCn+0utkeQbWaNPjbKyFBw+bXOWjdN1gwdpTyiHwQbmcXvYcmqsA7
	Sasld6IJiBSug3eP6r3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA14s-000000056nL-0Uii;
	Thu, 23 May 2024 05:33:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA14p-000000056mu-0s8Y
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 05:33:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1f2ecea41deso113145635ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 22 May 2024 22:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1716442397; x=1717047197; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qgiwWJtIZxG6QV0e+5Z/3AnExLYFakrMdTkm5akvgmk=;
        b=fZQDWdOZxD1v61KNcq9Xa6fyNEBMdFI/mPNvmO6E9ZSf9LYLXMYDEyzSwVK0fM3wA8
         UnhsaMfC2uwwNsmx7Yj+j4upPmaMjaZyd0r5lCotC670GJbSpPAg2xXCTGRs1V4y3pG/
         FyFYi5ODwJAekSMRQAwpwomQ7RTT/zFXtejiiXflmu2vhY1UOS6unZM/ZDY3KjYxUtUk
         qWzmxQlJvuH5f2JLsIAMnP7DS1NvUWSe4uyuHEiHoMhK4y4WIyKuTqAKMUtxhA6Igls3
         3a9bwHLVJi75JmHvna3+tbxFe7CPhYl7Zm1Cqoa0kPcjy/2p14c6eEvriNi02FoaXfu6
         i/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716442397; x=1717047197;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qgiwWJtIZxG6QV0e+5Z/3AnExLYFakrMdTkm5akvgmk=;
        b=E713WYMTy+ywN/yE5aNBe0eEgbv+Pczljmtby4GGJ2OWb2UC+uMjF1Jp/eaRkfI9jL
         H/zRtVZ4UK7/IF6a0M3ogkIQHjljDvPHJCtvcOPSQeXeZzZDmpl4QmEIZJNDGESbwfik
         J893LBSinkVi9ozFlRZXI1NxPFMSa/d1CqhFFlKxpu8uh4OULlqMSFptUQ5K/dzbTWW7
         C4rypum7vE8+yEFX6+154IoSE7Knqu1X1CXkJPwQWexEPzcUEEEODzdmpaDj2ir/aEDF
         ZVTMUDlBwvCo0/tuRFVknCGTUv3b4px+/DS/k0LYLo53Os1Q9+o5TJkPMISGh0JJFQp9
         B4yg==
X-Forwarded-Encrypted: i=1; AJvYcCXpSjxCNCZtGqYuhrvbfJVnYPK8SCqLzOd7yCMkdv2A+CB1IY7xLmkbxhhme0w0BiqtIiQYDABQNX5uvKQzyxKGB4cGs+nVH8EJJFGPUCBz
X-Gm-Message-State: AOJu0YyeZ4uy6cu1yPPdFFjKcSEaIwK+maZEm/cMyI0eeX+T4k9sGIAE
	/8PYVugIcc1V/lqdYGu+ebDc/xbWRZcujpRkRy9WbIes6txDT0BhPgz+xDz9sWhx0H5eujMzEjQ
	5cig=
X-Google-Smtp-Source: AGHT+IFpNjNr0AMcjXWFGpO8fBvlvN5/CJoJC2U9eoBzRTWQ2WEHB8d5xUlcwfS3W3L22LhcHrfcPg==
X-Received: by 2002:a17:903:2451:b0:1f3:f8c:5583 with SMTP id d9443c01a7336-1f31c9f040dmr45980425ad.52.1716442396968;
        Wed, 22 May 2024 22:33:16 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f33d2ca981sm5162695ad.159.2024.05.22.22.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 22:33:16 -0700 (PDT)
Message-ID: <664ed51c.170a0220.23a0f.1981@mx.google.com>
Date: Wed, 22 May 2024 22:33:16 -0700 (PDT)
MIME-Version: 1.0
X-Kernelci-Branch: for-next
X-Kernelci-Tree: riscv
X-Kernelci-Kernel: v6.9-11099-gc6c901b7d9833
X-Kernelci-Report-Type: build
Subject: riscv/for-next build: 10 builds: 8 failed, 2 passed,
 8 errors (v6.9-11099-gc6c901b7d9833)
To: kernelci-results@groups.io, kernel-ci-triage@rivosinc.com,
 linux-riscv@lists.infradead.org
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_223319_391287_A2CC0243 
X-CRM114-Status: UNSURE (   3.97  )
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

cmlzY3YvZm9yLW5leHQgYnVpbGQ6IDEwIGJ1aWxkczogOCBmYWlsZWQsIDIgcGFzc2VkLCA4IGVy
cm9ycyAodjYuOS0xMTA5OS1nYzZjOTAxYjdkOTgzMykKClRoaXMgbGVnYWN5IEtlcm5lbENJIHBy
b3ZpZGluZyB0aGlzIHJlcG9ydCB3aWxsIHNodXRkb3duIHNvbWV0aW1lCnNvb24gaW4gZmF2b3Ig
b2Ygb3VyIG5ldyBLZXJuZWxDSSBpbmZyYS4gTm90IGFsbCB0ZXN0cyBhcmUgYmVpbmcKbWlncmF0
ZWQuCklmIHlvdSBhcmUgc3RpbGwgdXNpbmcgdGhpcyByZXBvcnQgYW5kIHdhbnQgdXMgdG8gcHJp
b3JpdGl6ZSB5b3VyCnVzZWNhc2UgaW4gdGhlIG5ldyBzeXN0ZW0sIHBsZWFzZSBsZXQgdXMga25v
dyBhdAprZXJuZWxjaUBsaXN0cy5saW51eC5kZXYKCkZ1bGwgQnVpbGQgU3VtbWFyeTogaHR0cHM6
Ly9rZXJuZWxjaS5vcmcvYnVpbGQvcmlzY3YvYnJhbmNoL2Zvci1uZXh0L2tlcm5lbC92Ni45LTEx
MDk5LWdjNmM5MDFiN2Q5ODMzLwoKVHJlZTogcmlzY3YKQnJhbmNoOiBmb3ItbmV4dApHaXQgRGVz
Y3JpYmU6IHY2LjktMTEwOTktZ2M2YzkwMWI3ZDk4MzMKR2l0IENvbW1pdDogYzZjOTAxYjdkOTgz
MzUxNGVjY2JjMzk1NzJlNTVjN2Q4MTM5N2EzYwpHaXQgVVJMOiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yaXNjdi9saW51eC5naXQKQnVpbHQ6IDEgdW5p
cXVlIGFyY2hpdGVjdHVyZQoKQnVpbGQgRmFpbHVyZXMgRGV0ZWN0ZWQ6CgpyaXNjdjoKICAgIGRl
ZmNvbmZpZzogKGNsYW5nLTE2KSBGQUlMCiAgICBub21tdV9rMjEwX2RlZmNvbmZpZzogKGNsYW5n
LTE2KSBGQUlMCiAgICBub21tdV9rMjEwX3NkY2FyZF9kZWZjb25maWc6IChjbGFuZy0xNikgRkFJ
TAogICAgbm9tbXVfdmlydF9kZWZjb25maWc6IChjbGFuZy0xNikgRkFJTAogICAgZGVmY29uZmln
OiAoZ2NjLTEwKSBGQUlMCiAgICBub21tdV9rMjEwX2RlZmNvbmZpZzogKGdjYy0xMCkgRkFJTAog
ICAgbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnOiAoZ2NjLTEwKSBGQUlMCiAgICBub21tdV92
aXJ0X2RlZmNvbmZpZzogKGdjYy0xMCkgRkFJTAoKRXJyb3JzIERldGVjdGVkOgoKcmlzY3Y6CiAg
ICBkZWZjb25maWcgKGdjYy0xMCk6IDEgZXJyb3IKICAgIGRlZmNvbmZpZyAoY2xhbmctMTYpOiAx
IGVycm9yCiAgICBub21tdV9rMjEwX2RlZmNvbmZpZyAoY2xhbmctMTYpOiAxIGVycm9yCiAgICBu
b21tdV9rMjEwX2RlZmNvbmZpZyAoZ2NjLTEwKTogMSBlcnJvcgogICAgbm9tbXVfazIxMF9zZGNh
cmRfZGVmY29uZmlnIChnY2MtMTApOiAxIGVycm9yCiAgICBub21tdV9rMjEwX3NkY2FyZF9kZWZj
b25maWcgKGNsYW5nLTE2KTogMSBlcnJvcgogICAgbm9tbXVfdmlydF9kZWZjb25maWcgKGdjYy0x
MCk6IDEgZXJyb3IKICAgIG5vbW11X3ZpcnRfZGVmY29uZmlnIChjbGFuZy0xNik6IDEgZXJyb3IK
CkVycm9ycyBzdW1tYXJ5OgoKICAgIDQgICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1lYXJseS5jOjUyOjQ3OiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIGNh
bGwsIGV4cGVjdGVkIDIsIGhhdmUgMwogICAgNCAgICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLWVhcmx5LmM6NTI6MjogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlv
biDigJhyaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2XigJkKCgo9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQoKRGV0YWlsZWQgcGVyLWRlZmNvbmZpZyBidWlsZCByZXBvcnRzOgoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMCB3
YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYzo1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRz
IHRvIGZ1bmN0aW9uIOKAmHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZeKAmQoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKAlCBGQUlMLCAxIGVycm9y
LCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKRXJyb3JzOgogICAgZHJpdmVycy9p
cnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUyOjQ3OiBlcnJvcjogdG9vIG1hbnkgYXJn
dW1lbnRzIHRvIGZ1bmN0aW9uIGNhbGwsIGV4cGVjdGVkIDIsIGhhdmUgMwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGdjYy0xMCkg4oCUIFBB
U1MsIDAgZXJyb3JzLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KZGVmY29uZmlnK0NPTkZJR19TTVA9biAocmlzY3YsIGNsYW5nLTE2KSDi
gJQgUEFTUywgMCBlcnJvcnMsIDAgd2FybmluZ3MsIDAgc2VjdGlvbiBtaXNtYXRjaGVzCgotLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV9rMjEwX2RlZmNvbmZpZyAocmlzY3YsIGNsYW5nLTE2
KSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCkVy
cm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYzo1Mjo0Nzog
ZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlvbiBjYWxsLCBleHBlY3RlZCAyLCBo
YXZlIDMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCm5vbW11X2syMTBfZGVmY29uZmlnIChyaXNj
diwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywgMCBzZWN0aW9uIG1pc21h
dGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHku
Yzo1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIOKAmHJpc2N2X2lw
aV9zZXRfdmlycV9yYW5nZeKAmQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfazIxMF9z
ZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgZ2NjLTEwKSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJu
aW5ncywgMCBzZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW1zaWMtZWFybHkuYzo1MjoyOiBlcnJvcjogdG9vIG1hbnkgYXJndW1lbnRzIHRv
IGZ1bmN0aW9uIOKAmHJpc2N2X2lwaV9zZXRfdmlycV9yYW5nZeKAmQoKLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0Kbm9tbXVfazIxMF9zZGNhcmRfZGVmY29uZmlnIChyaXNjdiwgY2xhbmctMTYpIOKA
lCBGQUlMLCAxIGVycm9yLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hlcwoKRXJyb3Jz
OgogICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUyOjQ3OiBlcnJv
cjogdG9vIG1hbnkgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIGNhbGwsIGV4cGVjdGVkIDIsIGhhdmUg
MwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0Kbm9tbXVfdmlydF9kZWZjb25maWcgKHJpc2N2LCBn
Y2MtMTApIOKAlCBGQUlMLCAxIGVycm9yLCAwIHdhcm5pbmdzLCAwIHNlY3Rpb24gbWlzbWF0Y2hl
cwoKRXJyb3JzOgogICAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jOjUy
OjI6IGVycm9yOiB0b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYcmlzY3ZfaXBpX3Nl
dF92aXJxX3Jhbmdl4oCZCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpub21tdV92aXJ0X2RlZmNv
bmZpZyAocmlzY3YsIGNsYW5nLTE2KSDigJQgRkFJTCwgMSBlcnJvciwgMCB3YXJuaW5ncywgMCBz
ZWN0aW9uIG1pc21hdGNoZXMKCkVycm9yczoKICAgIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtZWFybHkuYzo1Mjo0NzogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5jdGlv
biBjYWxsLCBleHBlY3RlZCAyLCBoYXZlIDMKCi0tLQpGb3IgbW9yZSBpbmZvIHdyaXRlIHRvIDxp
bmZvQGtlcm5lbGNpLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
