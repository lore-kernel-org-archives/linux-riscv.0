Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 242F4C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 16:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5082086B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 16:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0eopmnZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="G9WNBz1V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5082086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PxoVck2VH71FiU+rp5KwpOiVHqMIHtoWNgPHkEPsIzI=; b=t0eopmnZH5UDB84EiTfkQbDF/
	lzTfJzw6csqYM6VUWJKTq+1JBaaxmKOFs2FUmQeI3A3vNM2eWl92CeuGk33bxnlkYNTM8f92vvrqm
	0Roh+xG5UQnjrcqa1NMACpigh3t1WrSDyNgTLMtY7yTvhRXRSzbEvqSBGfEb+tWolZcMQ8QnrGZkC
	h2dyGwabuO0H2zuxINMM5PcmwmmPFhbmi2WEa1OOdzFlt1JTnDfIYhvkqL59g8yRQKAMaCA79hSO+
	IN/PHIwMBcwyPTr5Xh1J0vB9nhLH+ujEx0r/e3whhXAeqqQfa2uw3iz5uJBZLI/rIHPzz6AHFtPLJ
	bgZoO8SXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNhM7-0007NY-Fj; Fri, 16 Nov 2018 16:52:31 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhM4-0007MI-S9
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 16:52:30 +0000
Received: by mail-pf1-x443.google.com with SMTP id w73so2339710pfk.10
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 08:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kpBoHgmOhN3LkMqkGpPGOvm/Fnxa3FRWSSY+xh/aFy4=;
 b=G9WNBz1VWb2+bpSH7A2MRusy3Khc031pTt2+5QbO+SInYhQfcM7XusBbXbdQF57Kep
 jUiSCn71t6bBhRX9kLvmJbMLmGoY0XJ04XngwZbkEG6zD58HDnp6PTAixynyknWKz9Pz
 zYAGq3AoNxs90CJAvTV1t7Z5qFa7FQnXfgHkTSumk5aJ0wH+r8oWHkl7myu8RrdM2M0U
 26vTp1RMqTo7J4HiHijGD0BjPA9r9rFvzEJziYxoGeP5NJJDB9vM+Guq3Iasw6GN7xxV
 +XgaUcd09IIPfz8lwevJ8JLaFA8BypVIkxUof3itA0EtslFfh79wH+0vdwNGhYPg8pHS
 vnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kpBoHgmOhN3LkMqkGpPGOvm/Fnxa3FRWSSY+xh/aFy4=;
 b=rFYU59+AVbbPy3ucUJB3En2BIzJMuxV3SqZgWLGrzoNck7yPzKdD/vJYpmpzgXgjVo
 M7qhfb9uOjYLpxvothkuta8ifB+WDZsVUL5atW1HW9bsTGHJvZtuDqFcSZgzlwVoPiOv
 SaRTDjNgcjyOSbJozkdSwt+02GnCG6tnGxMN1PvoAmA6u5nhWMLxvrmvnp4X4hqHagaA
 +Pt0GWs+wAXbrrkYY4M9NZNK0seffP3Cf8t1g13/+qq1yLUjrH9gYa9JQGjzRdzGXpUL
 32LNaiv6fEKZCraQKg7iwkIq0T9pYDtFuj1MSdOuaybt01J0+bBGhSPtOVeY3Nchl+b3
 dejw==
X-Gm-Message-State: AGRZ1gI8I2iZFcFYftg5N+3TGYYfjYXg+4HLD2xZ+BauJ1HFTG75ZYx/
 7/9EuZLua9avFtWIHSkVnEUiHOtLCqClAQ==
X-Google-Smtp-Source: AJdET5dUt6eKgbrD04wNFfmJgzRAcUchuJFFblOU/G4XJkm6D34n//w+0lNyCYgfHM2dqnkV47+pLw==
X-Received: by 2002:a63:e615:: with SMTP id g21mr10841155pgh.290.1542387137227; 
 Fri, 16 Nov 2018 08:52:17 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z83-v6sm37608428pfi.4.2018.11.16.08.52.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 08:52:16 -0800 (PST)
Date: Fri, 16 Nov 2018 08:52:16 -0800 (PST)
X-Google-Original-Date: Fri, 16 Nov 2018 07:01:12 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: recognize S/U mode bits in print_isa
In-Reply-To: <20181109214217.27494-1-me@packi.ch>
From: Palmer Dabbelt <palmer@sifive.com>
To: me@packi.ch
Message-ID: <mhng-e9ecd06a-7b9c-4b0f-af31-2c4c3b64c1a5@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_085228_975539_EAB70143 
X-CRM114-Status: GOOD (  17.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116165216.8bp4wiXELKWwO8XHHrhg1aoBk8uuqkw9BZnR56iYgW4@z>

T24gRnJpLCAwOSBOb3YgMjAxOCAxMzo0MjoxNiBQU1QgKC0wODAwKSwgbWVAcGFja2kuY2ggd3Jv
dGU6Cj4gUmVtb3ZlcyB0aGUgd2FybmluZyBhYm91dCBhbiB1bnN1cHBvcnRlZCBJU0Egd2hlbiBy
ZWFkaW5nIC9wcm9jL2NwdWluZm8KPiBvbiBRRU1VLiBUaGUgIlMiIGV4dGVuc2lvbiBpcyBub3Qg
YmVpbmcgcmV0dXJuZWQgYXMgaXQgaXMgbm90IGFjY2Vzc2libGUKPiBmcm9tIHVzZXJzcGFjZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgU3TDpGhsaW4gPG1lQHBhY2tpLmNoPgo+IC0tLQo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyB8IDkgKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IGluZGV4IDNhNWEy
ZWUzMTU0Ny4uYjRhN2Q0NDI3ZmJiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBAQCAtNjQsNyArNjQsNyBAQCBp
bnQgcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCj4K
PiAgc3RhdGljIHZvaWQgcHJpbnRfaXNhKHN0cnVjdCBzZXFfZmlsZSAqZiwgY29uc3QgY2hhciAq
b3JpZ19pc2EpCj4gIHsKPiAtCXN0YXRpYyBjb25zdCBjaGFyICpleHQgPSAibWFmZGMiOwo+ICsJ
c3RhdGljIGNvbnN0IGNoYXIgKmV4dCA9ICJtYWZkY3N1IjsKPiAgCWNvbnN0IGNoYXIgKmlzYSA9
IG9yaWdfaXNhOwo+ICAJY29uc3QgY2hhciAqZTsKPgo+IEBAIC04OCwxMSArODgsMTQgQEAgc3Rh
dGljIHZvaWQgcHJpbnRfaXNhKHN0cnVjdCBzZXFfZmlsZSAqZiwgY29uc3QgY2hhciAqb3JpZ19p
c2EpCj4gIAkvKgo+ICAJICogQ2hlY2sgdGhlIHJlc3Qgb2YgdGhlIElTQSBzdHJpbmcgZm9yIHZh
bGlkIGV4dGVuc2lvbnMsIHByaW50aW5nIHRob3NlCj4gIAkgKiB3ZSBmaW5kLiAgUklTQy1WIElT
QSBzdHJpbmdzIGRlZmluZSBhbiBvcmRlciwgc28gd2Ugb25seSBwcmludCB0aGUKPiAtCSAqIGV4
dGVuc2lvbiBiaXRzIHdoZW4gdGhleSdyZSBpbiBvcmRlci4KPiArCSAqIGV4dGVuc2lvbiBiaXRz
IHdoZW4gdGhleSdyZSBpbiBvcmRlci4gSGlkZSB0aGUgc3VwZXJ2aXNvciAoUykKPiArCSAqIGV4
dGVuc2lvbiBmcm9tIHVzZXJzcGFjZSBhcyBpdCdzIG5vdCBhY2Nlc3NpYmxlIGZyb20gdGhlcmUu
Cj4gIAkgKi8KPiAgCWZvciAoZSA9IGV4dDsgKmUgIT0gJ1wwJzsgKytlKSB7Cj4gIAkJaWYgKGlz
YVswXSA9PSBlWzBdKSB7Cj4gLQkJCXNlcV93cml0ZShmLCBpc2EsIDEpOwo+ICsJCQlpZiAoaXNh
WzBdICE9ICdzJykKPiArCQkJCXNlcV93cml0ZShmLCBpc2EsIDEpOwo+ICsKPiAgCQkJaXNhKys7
Cj4gIAkJfQo+ICAJfQoKVGhpcyBsb29rcyBnb29kIHRvIG1lLiAgSSdsbCB0YXJnZXQgaXQgZm9y
IHRoZSBSQ3MsIGFzIGl0J3MgZmFpcmx5IHNtYWxsIGFuZCAKdGhhdCB3YXJuaW5nIGZpcmVzIHRv
byBvZnRlbi4KClRoYW5rcyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
