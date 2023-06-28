Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69979EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjGTFTcyNM8qrwilDzdo+35mBU/VuTR24byXNbzZXxg=; b=bZKMH5r/9yk/ZS
	bG9XAAfhzZSqbR+16T5zTfdIl8gTrO9UdNi25XB4qJ0mocE6sAzIrDnA74sm7bCxNy2S8AS2G2Bw3
	qZ4Gg46GFLd5ucQlFcikJBMlIV98/qkTqJRj0RhEHGrf3XB0QeAqmyxxjTYycrGfK37YwzA34OJt/
	5hDFSmAV5KBalo0p6j1CszM+EWErXs98e3EkxGIZFK2PWbRphH+bbU74h22Y0aFwqkD1og0m3z7Pe
	kigHntA9G3GU9ASczws4QpbU7MIiz4UNWGY38GmFYOwgRcnNqFuva3KnrvW6/6DDHwXZZUVps3pso
	5IgZOBKdLm27qdXBAR1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPr1-00F5Wx-0J;
	Wed, 28 Jun 2023 07:44:43 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEPqx-00F5V7-2E
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 07:44:41 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 35S7iT5E060361
	for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 10:44:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1687938268; x=1690530268;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p8V5keLqZmvghqwdTNhha7x0Up0dRy6dy2mG52JFhz0=;
	b=UwHN5CAQyRm3KAhAmLCvT14b0hj9J0mgCI4yzHrD4xUrQX7s3YzW3+UOyMtHtO4l
	+kkat1O6fQcT7gTx5MaItShLs4i5za8q6SnZxTpko7AAxkDV3mWfRt21iGLKiEMg
	141u7K4iBBVldJpeVFJFkYP85TsewxyDejBLBH+r9sPWEQT7eX3ioA2h+uFnv6u3
	Cin73X6F4fuOYWgMJgMNmU0VhoGAwX9rpqD7zpXVlA71ogRSRha/MIdnBLRMxvcM
	/AdTIEdszr/Lh1ig7xHdZ6cAmjUUjPcSubVBbmT7VKHPuyTW8sr2kU/Cy5uAFlK/
	bXpQDGoxqXU1sae2RAi0dQ==;
X-AuditID: 8b5b014d-a23ec70000002178-01-649be4dc9c9e
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id A3.E5.08568.CD4EB946; Wed, 28 Jun 2023 10:44:28 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <6dc3a208-e180-18b4-c87e-50735edd595b@ics.forth.gr>
Date: Wed, 28 Jun 2023 10:44:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] RISC-V: mm: Restrict address space for sv39,sv48,sv57
Content-Language: el-GR, en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, jrtc27@jrtc27.com
Cc: charlie@rivosinc.com, alexghiti@rivosinc.com,
        Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
        Bjorn Topel <bjorn@rivosinc.com>, anup@brainfault.org,
        Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
References: <mhng-7914c1d2-d671-4cc4-ba90-f85acb7c8b50@palmer-ri-x1c9>
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <mhng-7914c1d2-d671-4cc4-ba90-f85acb7c8b50@palmer-ri-x1c9>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsXSHT1dWffOk9kpBpN2qFs8bjzOaNHy4R2r
	xdbfs9gtNv//wmzx9sYrRot7E7+zWKycuorN4sgUO4s9CycyW+z8/IXRYmHbEhaL6Xfes1nc
	W/Of1WLb5xY2iwVH0y3aZvE7CHhM/X2GxeNwxxd2j5Xv37F4bFrVyeax6dMkdo/9c9ewe2xe
	Uu9xY1aEx6Xm6+wenzfJBXBFcdmkpOZklqUW6dslcGXcX76fueAzV8Wa040sDYx3OboYOTkk
	BEwkPmyezdbFyMUhJHCUUWLa50ZmiISlxOZPL1lAbF4Be4lXr56BxVkEVCVaNjYzQcQFJU7O
	fAJWIyoQLbH68wVWEFtYwE9i+vKfjCA2s4CcxPtn28HiIgLWEgcOHGUFWcYscJlZYtGMlWCD
	hATcJDb9eg42iE1AU2L+pYNgNqeAu8SCCfeZIQaZSXRt7YIaKi/RvHU28wRGgVlI7piFZN8s
	JC2zkLQsYGRZxSiQWGasl5lcrJeWX1SSoZdetIkRHHeMvjsYb29+q3eIkYmD8RCjBAezkgiv
	2I/pKUK8KYmVValF+fFFpTmpxYcYpTlYlMR5T9guSBYSSE8sSc1OTS1ILYLJMnFwSjUwHfl9
	5aVUUBHHJcF7/Y8j50tdMu1U/DLliox05Y0v3PKr8jqaPq9xnfd648PUy731PfMs3CsenGt9
	US6wet33SjWFuheP0l6nLz3gIjVPPYL723a+uweiVy9wCV/UqFfnflqgt5VHs3XxYsPNBSKS
	IsJ/8/taHD6caRdM4zp23s2qsrrnT1zj0q4lfOuVnlQbHDXJ5/i89+eOy0/WRd3SVFzaL/l1
	0ZvQkqPml11ELK8vcGkSUzc0d0tS2lv2KSKurkUy10Xm6yuTfT61TC63fzslnD/Xv1jOUJVx
	1l5OEe0lvR/OTMn9fq106u1ZTOdOz5tc8/WH0h5+W4332z5eaF4XXZ07aXbWk08bvRetUGIp
	zkg01GIuKk4EAMjdIykqAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_004440_111868_E89E0165 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNi8yOC8yMyAwMjozNiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAyNyBKdW4g
MjAyMyAxNTozMjozNiBQRFQgKC0wNzAwKSwganJ0YzI3QGpydGMyNy5jb20gd3JvdGU6Cj4+IE9u
IDI3IEp1biAyMDIzLCBhdCAyMzoyMSwgQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gTWFrZSBzdjM5IHRoZSBkZWZhdWx0IGFkZHJlc3Mgc3BhY2Ug
Zm9yIG1tYXAgYXMgc29tZSBhcHBsaWNhdGlvbnMKPj4+IGN1cnJlbnRseSBkZXBlbmQgb24gdGhp
cyBhc3N1bXB0aW9uLgo+Pgo+PiBUaGV5IGFyZSBqdXN0IHBsYWluIHdyb25nIHRvby4gU3Y0OCB3
YXMgaW4gZXZlbiBQcml2IHYxLjEwICh0aGUgZmlyc3QKPj4gc3BlYyB3aGVyZSBzYXRwIHdhcyBu
YW1lZCBhcyBzdWNoIGFuZCBjb250YWluZWQgdGhlIG1vZGUsIHJhdGhlciB0aGFuCj4+IHJlcXVp
cmluZyBNLW1vZGXigJlzIGhlbHAgaW4gY29uZmlndXJpbmcgdmlydHVhbCBtZW1vcnkpLCBwcmVk
YXRpbmcgdGhlCj4+IHJhdGlmaWVkIHYxLjExIHNwZWMuIEEgMzktYml0IGFkZHJlc3Mgc3BhY2Ug
aXMgcGF0aGV0aWMgYW5kIGhhcwo+PiBpbXBsaWNhdGlvbnMgZm9yIEFTTFIuCj4+Cj4+IEkgc3Ry
b25nbHkgc3VnZ2VzdCBhcHBsaWNhdGlvbnMgYmUgZm9yY2VkIHRvIHN1cHBvcnQgYXQgbGVhc3Qg
U3Y0OCwKPj4gd2hpY2ggaXMgdG90YWxseSByZWFzb25hYmxlIGdpdmVuIHRoZSBhZGRyZXNzIHNw
YWNlIHNpemVzIHVzZWQgYnkgb3RoZXIKPj4gYXJjaGl0ZWN0dXJlcy4gU3Y1NyBpcyBtb3JlIGRp
c3J1cHRpdmUgdG8gc29tZSBydW50aW1lcywgdGhvdWdoIGlkZWFsbHkKPj4gZXZlbiB0aGF0IHdv
dWxkIGJlIGZyZWUgZm9yIHRoZSBrZXJuZWwgdG8gdXNlIHJhdGhlciB0aGFuIGNvbW1pdHRpbmcg
dG8KPj4gbm90IHVzaW5nIGl0IGZvciB0aGUgZGVmYXVsdCB1QUJJLgo+IAo+IEdvIGFuZCBPcGVu
SkRLIGJvdGggYnJva2Ugd2hlbiB3ZSBleHBhbmRlZCB0aGUgVkEgd2lkdGguwqAgSSBkb24ndCBs
aWtlIAo+IGl0IGVpdGhlciwgYnV0IGlmIHRoZSBjaGFuZ2UgYnJlYWtzIHVzZXJzcGFjZSB0aGVu
IGl0J3MgYSByZWdyZXNzaW9uIGFuZCAKPiB3ZSBoYXZlIHRvIGxpdmUgd2l0aCB0aGUgYnVnLgo+
IAoKSGF2ZSB3ZSBkZWJ1Z2dlZCB0aGlzID8gZG8gd2UgYXQgbGVhc3Qga25vdyB3aHkgdGhleSBi
cmVhayA/IEp1c3QgCmRpc2FibGluZyBTdjQ4LzU3IGJ5IGRlZmF1bHQgZm9yIGV2ZXJ5b25lIGJl
Y2F1c2Ugc29tZSB1c2Vyc3BhY2UgYXBwcyAKYnJlYWsgZG9lc24ndCBzZWVtIHRoZSBjb3JyZWN0
IGFwcHJvYWNoLCBpdCBzZWVtcyBtb3JlIGxpa2UgYSBidWcgaW4gCnVzZXJzcGFjZSBJTUhPLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
