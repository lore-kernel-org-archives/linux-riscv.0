Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCC4FF8850
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 02:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBm/Zss5b2flW8p/fHnhtzojC0L+/3Q2Z3RiRdEWs9c=; b=v8xtLbZyM9ZtmP
	xcgX1mQMcYq031MCjsFdEt8sjDqxIufLAKAuyPNg6JPp9Nb1GOhAQCmem2RKFsZPZIqAvb7L/R2mx
	euIBAKXMnwFv5LfMo+i3lo/l+h5aoMkjLz9zZE6xgbz4JFuzhML37QqduLFWYg3TFxWVMrEQbcgsP
	85WgTiHY9f0vAysjvfOhSoS9F9E/NwAEGmFfCNh8pnjdCDf0/MJFowswL/StJoIR69s1mHOfzhvBV
	BOKDjkthQboLkGhSl/uoblmv8dOCIpE3pSPWEK0uTYEM+xMUubIufM6pdv/kZdPO15Rn0+aKhQGvz
	Qgq+lUjrJZ5NqdyAjNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGSMK-0000000DzOj-0Twx;
	Sat, 25 Apr 2026 02:03:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGSMJ-0000000DzOd-1hvJ
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 02:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C7F160052;
	Sat, 25 Apr 2026 02:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 115C3C19425;
	Sat, 25 Apr 2026 02:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777082581;
	bh=A45K/CWK8n0nOi0K0sJmVboJfyVuvgSAW7/u0eXkmN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FDfpxbcqUp79tafLBYbvroiHXf20yajaf9RY5wjHdgFt7C9zegzNcLwKzxoYYniGR
	 BJWjDcdhdZGq1vYEhhkBzNlrYn3rrGGFbd7JaiY+65rB8HgUzeRz/8WlHeRaqII3Em
	 sBwjZbKgIPM6zeck0MnGc6qswtaRPR1k7oPrvu84nyGnRWrkL768K1bSRxRxin256U
	 CR+rGUOvJmcuYyL1Z8+OHb4GHtv/8sqvaEf05a6wwzjdMlEddsY3FDGv6gFJ8H6SFr
	 TuIK5jWZHjMomXQU1Zurgx+/bw0X5BY3gbXpcWLnsxTH6Bfkr+c/6gGeP6Ub7rbbWj
	 j3wUsKWN57f/Q==
From: Guo Ren <guoren@kernel.org>
To: wangruikang@iscas.ac.cn
Cc: alex@ghiti.fr,
	gaohan@iscas.ac.cn,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: mm: Do not probe satp mode limit if known in FDT
Date: Sat, 25 Apr 2026 02:02:51 +0000
Message-ID: <20260425020253.3323599-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424-riscv-mm-trust-fdt-mmu-type-v1-1-57f3313275d2@iscas.ac.cn>
References: <20260424-riscv-mm-trust-fdt-mmu-type-v1-1-57f3313275d2@iscas.ac.cn>
MIME-Version: 1.0
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

PiBTb21lIHN5c3RlbXMgbWF5IG9ubHkgaGF2ZSBtZW1vcnkgYXQgc3VjaCBhIGhpZ2ggYWRkcmVz
cyB0aGF0IGFuCj4gaWRlbnRpdHkgbWFwcGluZyBjYW5ub3QgYmUgbWFkZSBpbiBTdjQ4LCBvciBl
dmVuIFN2NTcuIFRvIGF2b2lkIGNyYXNoaW5nCj4gd2hpbGUgcHJvYmluZyBzYXRwIG1vZGUgc3Vw
cG9ydCwgdHJ1c3QgdGhlIG1tdS10eXBlIHByb3BlcnR5IGZyb20gRkRUCj4gYW5kIGF2b2lkIHBy
b2JpbmcgaWYgaXQgaXMgc2V0Lgo+IAo+IEZvciBleGFtcGxlLCBpZiBhIENQVSBzdXBwb3J0cyAo
dXAgdG8pIFN2NTcgYnV0IHRoZSBTb0MgaXQgaXMgb24gb25seQo+IGhhcyBtZW1vcnkgc3RhcnRp
bmcgYXQgMTI4IFRpQiwgYW4gaWRlbnRpdHkgbWFwcGluZyBjYW5ub3QgYmUgbWFkZSBpbgo+IFN2
NDguIElmIHRoZSB1c2VyIHNwZWNpZmllcyAibm81bHZsIiBvbiB0aGUgY29tbWFuZCBsaW5lLAo+
IHNldF9zYXRwX21vZGUoKSB3aWxsIGF0dGVtcHQgdG8gdGVzdCBTdjQ4IHN1cHBvcnQgYW5kIGNy
YXNoLCBzaW5jZSB0aGUKPiB2aXJ0dWFsIGFkZHJlc3MgaXMgdG9vIGhpZ2guIEluc3RlYWQsIGdp
dmVuIHRoZSBjb3JyZWN0IEZEVCBDUFUgbm9kZQo+IHByb3BlcnR5IG1tdS10eXBlID0gInJpc2N2
LHN2NTciLCBzZXRfc2F0cF9tb2RlKCkgY2FuIHBpY2sgdGhlIG1heGltdW0KPiBhbGxvd2VkIG1v
ZGUgZnJvbSBjb21tYW5kIGxpbmUgYW5kIEZEVCwgbmFtZWx5IFN2NDgsIHdpdGhvdXQgcHJvYmlu
Zy4KPiAKPiBIYW5kbGluZyBvZiBtbXUtdHlwZSAicmlzY3Ysc3Y1NyIgaW4gc2V0X3NhdHBfbW9k
ZV9mcm9tX2ZkdCgpIGlzIGFkZGVkCj4gc2luY2UgaXQgaXMgbm93IG5lZWRlZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBWaXZpYW4gV2FuZyA8d2FuZ3J1aWthbmdAaXNjYXMuYWMuY24+Cj4gLS0tCj4g
VGVzdGVkIG9uIFFFTVUgMTAuMi4yIG9uIGFsbCAzKjMgY29tYmluYXRpb25zIG9mIFN2MzkvU3Y0
OC9TdjU3IGFuZAo+IChub25lKS9ubzRsdmwvbm81bHZsLgo+IAo+IEluIHRoZW9yeSB0aGlzIGNv
dWxkIGJlIGEgYnJlYWsgaWYgbW11LXR5cGUgaXMgd3JvbmcsIGJ1dCBzbyBtYW55IG90aGVyCj4g
dGhpbmdzIHdvdWxkIGJyZWFrIGlmIHRoZSBGRFQgaXMgd3JvbmcgYW55d2F5Lgo+IAo+IEFsc28g
bm90ZSB0aGF0IHRoaXMgZG9lc24ndCBhcHBseSBvbiBBQ1BJIHNpbmNlIGl0IGlzIGRpZmZpY3Vs
dCB0byB1c2UKPiBBQ1BJQ0EgYW5kIHJlYWQgQUNQSSBSSENUIGF0IHRoaXMgcG9pbnQsIHNvIHRo
YXQgd2lsbCBqdXN0IGZhbGwgYmFjayB0bwo+IHByb2JpbmcuIEhvcGVmdWxseSBVRUZJL0FDUEkg
KyB0aGlzIGF0cm9jaW91cyBTb0MgZGVzaWduIG5ldmVyIGhhcHBlbnMsCj4gc2luY2UgdGhlIGhp
Z2ggbWVtb3J5IGJhc2UgYWRkcmVzcyB3b3VsZCBwcmV2ZW50IGEgbG90IG9mIFBDSShlKSBkZXZp
Y2VzCj4gZnJvbSB3b3JraW5nIHdpdGhvdXQgYW4gSU9NTVUuIChGaW5nZXJzIGNyb3NzZWQuKQoK
TWlzc2luZyBVRUZJL0FDUEkgaXMgaW5jb3JyZWN0LiBSSVNDLVYgc2VydmVycyBzdGFuZGFyZGl6
ZSBvbiBVRUZJK0FDUEkuCldlIHNob3VsZCBzdXBwb3J0IFJIQ1QgcGFyc2luZyBpbnN0ZWFkIG9m
IGhvcGluZyBoaWdoLW1lbW9yeSBBQ1BJIHN5c3RlbXMK4oCcbmV2ZXIgaGFwcGVu4oCdLgoKQ2Fs
bGluZyB0aGUgaGlnaC1tZW1vcnkgU29DIGRlc2lnbiDigJxhdHJvY2lvdXPigJ0gaXMgdGVjaG5p
Y2FsbHkgd3JvbmcgYW5kCmNvbmNlcm5pbmcuIFRoZSBSSVNDLVYgc3BlYyBleHBsaWNpdGx5IGFs
bG93cyBEUkFNIGF0IGFueSBwaHlzaWNhbCBhZGRyZXNzCihlLmcuIDEyOCBUaUIpLiBXaXRoIFRC
L1BCLXNjYWxlIG1lbW9yeSBvbiB0aGUgaG9yaXpvbiwgdGhpcyBpcyBhIHZhbGlkIFNvQwpjaG9p
Y2UuCgpUaGlzIHBhdGNoIGRvZXMgbm90IHNvbHZlIHRoZSBwcm9ibGVtIGF0IGl0cyByb290LiBU
aGUgY29yZSBpc3N1ZSBpcyB0aGF0CndlIGFyZSBwYXNzaW5nIGFuIGludmFsaWQgdmlydHVhbCBh
ZGRyZXNzIChWQSkgYXMgaW5wdXQgdG8gc2F0cCBtb2RlCnByb2JpbmcuIFN0cmVuZ3RoZW5pbmcg
dGhlIFZBIGNoZWNrIG9uIHRoZSBpbnB1dCBzaWRlIHdvdWxkIGZpeCBpdCBjbGVhbmx5LgoKSSBh
bHJlYWR5IHBvc3RlZCB0aGUgZml4IGZvciB0aGlzIGV4YWN0IGlzc3VlIHRocmVlIG1vbnRocyBh
Z286IFsxXS4KVGhpcyBzaG91bGQgYWRkcmVzcyBib3RoIERUIGFuZCBVRUZJL0FDUEkgc2NlbmFy
aW9zLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyNTA1
NTIxMi40MzMxNjMtMS1ndW9yZW5Aa2VybmVsLm9yZy8KCkJlc3QgUmVnYXJkcwogIEdVTyBSZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
