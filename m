Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0676C4706C
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzXtVp1jbxK7Iu0w0f4cCGIy8V/d21usQR3bKIN7zYY=; b=2g86V3MgfdUZeX
	7kZ30p5wMukUMgmjKQITi2YkUmA5CMXkE60W26GLgG7BhZcJbQ9hM9/f3nmkzk2/9sEMVWCRYt5e+
	wN+txzfPIlxVcbuX6yf4FLvCRQWwL3n+LHW2FEs74N7vdB7X6to3WWMH6voVvdJcE2tMRPvTvNLMj
	/OLb9nJLbQBLKS/NcxiEUQVmnjoskn7dqN/wNHQribc6VU7yyYtAK7nYv+UriodkxZ+yIorMWfchr
	J7EE028oipJUzX20O/z9btaOEh1AxomG2QUD7gSyuscDxTTOHibdb7y62xcxgv6b5O8BERcjesS3g
	pGeBoCm6CMm+pAq7xfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9r-005sMe-2A;
	Fri, 22 Dec 2023 11:57:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9p-005sKx-1l
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:57:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A09761BF4;
	Fri, 22 Dec 2023 11:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A766CC433C8;
	Fri, 22 Dec 2023 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246256;
	bh=Bpr3cN4ZdKoHQcirLqVi0ln0qEuA20LN4TwxV/9UyIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjcGbIgbK6jeqRf0kFK/o/IXjdlWN8p3XQ341829gtV0RN55zBIUKzU9aN7xDTlgA
	 zyf6OCzTD5OC9qHWt3vJyq2YcHKDP0SMJ9HbtR3ap1kESS4nV7DFY31dyGYZY+JuVS
	 J3FlEf3O+GyKQDOBGV9HsfJ2kT/RSJQdmiz0fDn5fgqKFknvpe2YPpAJLkf7ZWp/dV
	 MPSXzXd+ixCj0hN9NEyzV5U/K6kPSbGIAipGtlKaXKWh7hpap4klETzGww7OPff+sx
	 bmPFbqvn/rbd2/W+Q3T/Q23dUe66PeSpwB/7AQErVEWtM+uQZhq42Q0OOt8taV+Pf2
	 Yh8qaadcxErdA==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 4/4] riscv: mm: Optimize TASK_SIZE definition
Date: Fri, 22 Dec 2023 06:57:03 -0500
Message-Id: <20231222115703.2404036-5-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231222115703.2404036-1-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035737_636737_70FD8166 
X-CRM114-Status: UNSURE (   8.22  )
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

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKVW5pZnkgdGhlIFRBU0tf
U0laRSBkZWZpbml0aW9uIHdpdGggVkFfQklUUyBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5LgpBZGQg
Q09NUEFUIG1vZGUgdXNlciBhZGRyZXNzIHNwYWNlIGluZm8gaW4gdGhlIGNvbW1lbnQuCgpSZXZp
ZXdlZC1ieTogTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+ClNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IGU0MTU1ODIyNzZlYy4uMjcxNTY1
ZTE5NTZmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaApAQCAtODY2LDYgKzg2Niw3IEBAIHN0
YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9jbGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQogICog
Tm90ZSB0aGF0IFBHRElSX1NJWkUgbXVzdCBldmVubHkgZGl2aWRlIFRBU0tfU0laRS4KICAqIFRh
c2sgc2l6ZSBpczoKICAqIC0gICAgICAgIDB4OWZjMDAwMDAJKH4yLjVHQikgZm9yIFJWMzIuCisg
KiAtICAgICAgICAweDgwMDAwMDAwCSggICAyR0IpIGZvciBSVjY0IGNvbXBhdCBtb2RlCiAgKiAt
ICAgICAgMHg0MDAwMDAwMDAwCSggMjU2R0IpIGZvciBSVjY0IHVzaW5nIFNWMzkgbW11CiAgKiAt
ICAgIDB4ODAwMDAwMDAwMDAwCSggMTI4VEIpIGZvciBSVjY0IHVzaW5nIFNWNDggbW11CiAgKiAt
IDB4MTAwMDAwMDAwMDAwMDAwCSggIDY0UEIpIGZvciBSVjY0IHVzaW5nIFNWNTcgbW11CkBAIC04
NzcsMTAgKzg3OCwxMCBAQCBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9zd3BfY2xlYXJfZXhjbHVz
aXZlKHB0ZV90IHB0ZSkKICAqIFNpbWlsYXJseSBmb3IgU1Y1NywgYml0cyA2M+KAkzU3IG11c3Qg
YmUgZXF1YWwgdG8gYml0IDU2LgogICovCiAjaWZkZWYgQ09ORklHXzY0QklUCi0jZGVmaW5lIFRB
U0tfU0laRV82NAkoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAvIDIpCisjZGVmaW5lIFRBU0tf
U0laRV82NAkoVUwoMSkgPDwgKFZBX0JJVFMgLSAxKSkKIAogI2lmZGVmIENPTkZJR19DT01QQVQK
LSNkZWZpbmUgVEFTS19TSVpFXzMyCShfQUMoMHg4MDAwMDAwMCwgVUwpKQorI2RlZmluZSBUQVNL
X1NJWkVfMzIJKFVMKDEpIDw8IChWQV9CSVRTX1NWMzIgLSAxKSkKICNkZWZpbmUgVEFTS19TSVpF
CSh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJVCkgPyBcCiAJCQkgVEFTS19TSVpFXzMyIDogVEFT
S19TSVpFXzY0KQogI2Vsc2UKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
