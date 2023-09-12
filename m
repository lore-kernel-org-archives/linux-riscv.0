Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA04BCA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 12:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/XXR3waJQ70SxiocszaBYfXVriA9ohPIc7HZ2S+4TbU=; b=AB5DVlGpA7YUBM
	GaCBJE2He4FpMC9/qDJcXDDcR2p+H5QAkZ66tugtehRUMKAMlU1QzrKrkHlpSO3GDofaFvrWL3S6P
	ItU9UbyzMT27cnc5MMSj4Frv4IeqqyZbRMcmcdpkUCPOaP1S0WolZXV1nB8Tj5XRrHY15M3/oQeh0
	Z5hAlEs2L8ZZ/Z9pdrO0gy9jjg/luC0qQ9sa0lWZ7llcPY3dGLa7DAH4Ov+HWdpiAwXPXGqIV6Tpp
	jt4pdzIYQ5KdKPzpxi/mKrcfKRYoKUuQQbbBJxro8sxFFYsxNg9fpEaGfeJvarRgGmQjSOA/CBw4Z
	+uCHWWljIhZVhdI9c+zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2H7-003Iwp-0l;
	Tue, 12 Sep 2023 12:13:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2H4-003IwB-22
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 12:13:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 05328B81C68;
	Tue, 12 Sep 2023 12:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28082C433C8;
	Tue, 12 Sep 2023 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694520823;
	bh=7jAMJX8m5mBzicQzcKiFy5A5RvULyRKUPRv33QhrqT8=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Tw4X9uOip7ayv+vbb7p/Qq+GkFp0FY3Mq+fPr+FTvm27n0fUZO5Zv/ve6W1BKuqfA
	 UqcvRyM4Y5dwoJYw9zoQFIFwKVWEtddvvhPFGP2B8h8p4lgxeaZaQp26iue1edlo9I
	 7dqNkv1TXu2h5ojnXNBfAohOQwgMsqDwUdivWxVFE2goZ84s5kMNsU1geHGxavAXFz
	 oBut8WStE8EVCwu8LqOMRMFviXTJObUaW14d0yivHdw97aiLa7bmaVv8gy/G8s0Wy1
	 GKA8GFT2EC2gDzyBPRRzWUbWoR31eMnR6QeYxphNRNSt3EjHdfMJKebFqD5OXDmAip
	 RqDSmC2IqWi0A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, guoren@kernel.org,
 bjorn@rivosinc.com, conor.dooley@microchip.com, jszhang@kernel.org,
 andy.chiu@sifive.com, cuiyunhui@bytedance.com,
 dave.hansen@linux.intel.com, elver@google.com, glider@google.com,
 cyphar@cyphar.com, kirill.shutemov@linux.intel.com, keescook@chromium.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] riscv: add userland instruction dump to RISC-V splats
In-Reply-To: <20230912021349.28302-1-cuiyunhui@bytedance.com>
References: <20230912021349.28302-1-cuiyunhui@bytedance.com>
Date: Tue, 12 Sep 2023 14:13:40 +0200
Message-ID: <87jzsvd1xn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_051346_818995_0356A741 
X-CRM114-Status: UNSURE (   6.62  )
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

WXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+IHdyaXRlczoKCj4gQWRkIHVzZXJs
YW5kIGluc3RydWN0aW9uIGR1bXAgYW5kIHJlbmFtZSBkdW1wX2tlcm5lbF9pbnN0cigpCj4gdG8g
ZHVtcF9pbnN0cigpLgo+Cj4gQW4gZXhhbXBsZToKPiBbICAgIDAuODIyNDM5XSBGcmVlaW5nIHVu
dXNlZCBrZXJuZWwgaW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogNjkxNksKPiBbICAgIDAuODIzODE3
XSBSdW4gL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gWyAgICAwLjgzOTQxMV0gaW5pdFsxXTogdW5o
YW5kbGVkIHNpZ25hbCA0IGNvZGUgMHgxIGF0IDB4MDAwMDAwMDAwMDA1YmUxOCBpbiBiYlsxMDAw
MCs1ZmIwMDBdCj4gWyAgICAwLjg0MDc1MV0gQ1BVOiAwIFBJRDogMSBDb21tOiBpbml0IE5vdCB0
YWludGVkIDUuMTQuMC1yYzQtMDAwNDktZ2JkNjQ0MjkwYWE3Mi1kaXJ0eSAjMTg3Cj4gWyAgICAw
Ljg0MTM3M10gSGFyZHdhcmUgbmFtZTogICwgQklPUwo+IFsgICAgMC44NDE3NDNdIGVwYyA6IDAw
MDAwMDAwMDAwNWJlMTggcmEgOiAwMDAwMDAwMDAwMDc5ZTc0IHNwIDogMDAwMDAwM2ZmZmNhZmRh
MAo+IFsgICAgMC44NDIyNzFdICBncCA6IGZmZmZmZmZmODE2ZTlkYzggdHAgOiAwMDAwMDAwMDAw
MDAwMDAwIHQwIDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDI5NDddICB0MSA6IDAwMDAw
MDNmZmZjOWZkZjAgdDIgOiAwMDAwMDAwMDAwMDAwMDAwIHMwIDogMDAwMDAwMDAwMDAwMDAwMAo+
IFsgICAgMC44NDM0MzRdICBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiAwMDAwMDAzZmZmY2Ew
MTkwIGExIDogMDAwMDAwM2ZmZmNhZmUxOAo+IFsgICAgMC44NDM4OTFdICBhMiA6IDAwMDAwMDAw
MDAwMDAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsg
ICAgMC44NDQzNTddICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDAw
IGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDQ4MDNdICBzMiA6IDAwMDAwMDAwMDAw
MDAwMDAgczMgOiAwMDAwMDAwMDAwMDAwMDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAg
MC44NDUyNTNdICBzNSA6IDAwMDAwMDAwMDAwMDAwMDAgczYgOiAwMDAwMDAwMDAwMDAwMDAwIHM3
IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDU3MjJdICBzOCA6IDAwMDAwMDAwMDAwMDAw
MDAgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44
NDYxODBdICBzMTE6IDAwMDAwMDAwMDBkMTQ0ZTAgdDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDog
MDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMC44NDY2MTZdICB0NSA6IDAwMDAwMDAwMDAwMDAwMDAg
dDYgOiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgICAwLjg0NzIwNF0gc3RhdHVzOiAwMDAwMDAwMjAw
MDAwMDIwIGJhZGFkZHI6IDAwMDAwMDAwZjAwMjgwNTMgY2F1c2U6IDAwMDAwMDAwMDAwMDAwMDIK
PiBbICAgIDAuODQ4MjE5XSBDb2RlOiBmMDZmIGZmNWYgMzgyMyBmYTExIDAxMTMgZmIwMSAyZTIz
IDAyMDEgMDI5MyAwMDAwICg4MDUzKSBmMDAyCj4gWyAgICAwLjg1MTAxNl0gS2VybmVsIHBhbmlj
IC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhIGV4aXRjb2RlPTB4MDAwMDAw
MDQKPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29t
PgoKUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
