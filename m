Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E7EC4708E
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 18:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFgSvWj+Q9IYZpTTB7gNvVIbEM9B+QXyODJzGMtpUjA=; b=AWA0Oc2WXilUmy
	neEYi2YHp7VhIPBqRRqRmwhQkIE/dcDEjx8AwSvfVKkk7xG07NC7IavgBDKJs9E+D/Uut0//CZvED
	iO7SOsaIE3Lk+/pR/6RUFLev2nMd5Zgms4MAGKxpx3OY+HEBxA9pEXahdGjzNggIrqJb4qeyud9pm
	UEYcjBbCdr08yrw/Jpw0FAZRBQUUPtygs3WRlCgIdIl5h5la65+14SD2Xca6JOSQ6aoAjVc6DToKs
	o1YLYTBKveAXmIxQayiA4kZGQ+uKXqbvcJg1BCppGiDQ9RQ3kNOPcfC9B3n+GeCa5mIPcWRabmC0O
	48X5AdXbJMZivQOXMm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPAs-00DL2L-EE; Mon, 02 Jan 2023 18:04:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCPA7-00DKtW-Hr
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 18:03:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3AFC3B80DD5;
	Mon,  2 Jan 2023 18:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C0CC433D2;
	Mon,  2 Jan 2023 18:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672682629;
	bh=BAjOdV6p7CxcpgFIt7D9jGccYF3iPP6U2STbHuh7wzo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P8db7gFYg4eaSIue3F/rJBz+rptHoe69biRi659Yfwa4lmsSxEeRcVmhtoHxxQkJE
	 FID1HOsfBVtQxLbYp5b4M+rPSGN/VCEeZvM1BYdv3a0p7T7j4jbUHxBhn7nWJILSMB
	 0YqhTDwPtdMX45YvAK6yDTU4owpAdnacD0pOeVY4CBQSvy9BhK530gCBKQTvpNltpv
	 29Y88tnwMzICarK6DBLHaKKBZeTioI6x98WWNrf9f32MBl6lbqmq/d0A/HqbjOkEIT
	 OinXzbk0vHMA9r1rFR6P8XlJBqjVQn82Mm580WxjJwrRx/UjwSMQlD7w6pl3Cof/Cc
	 T2cGgb5cfZgtQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Guokai <chenguokai17@mails.ucas.ac.cn>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rostedt@goodmis.org,
 mingo@redhat.com, sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 liaochang1@huawei.com, Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: Re: [PATCH v5 4/9] riscv/kprobe: Add common RVI and RVC instruction
 decoder code
In-Reply-To: <20221224114315.850130-5-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
 <20221224114315.850130-5-chenguokai17@mails.ucas.ac.cn>
Date: Mon, 02 Jan 2023 19:03:46 +0100
Message-ID: <87tu18vmnx.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_100351_762167_CDB0FFA3 
X-CRM114-Status: UNSURE (   7.70  )
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

Q2hlbiBHdW9rYWkgPGNoZW5ndW9rYWkxN0BtYWlscy51Y2FzLmFjLmNuPiB3cml0ZXM6Cgo+IEZy
b206IExpYW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmggYi9hcmNoL3Jpc2N2L2tlcm5l
bC9wcm9iZXMvc2ltdWxhdGUtaW5zbi5oCj4gaW5kZXggY2I2ZmY3ZGNjYjkyLi43NGQ4YzFiYTkw
NjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3NpbXVsYXRlLWluc24u
aAo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9zaW11bGF0ZS1pbnNuLmgKPiBAQCAt
MzcsNiArMzcsNDAgQEAgX19SSVNDVl9JTlNOX0ZVTkNTKGNfamFsciwJMHhmMDA3LCAweDkwMDIp
Owo+ICBfX1JJU0NWX0lOU05fRlVOQ1MoY19iZXF6LAkweGUwMDMsIDB4YzAwMSk7Cj4gIF9fUklT
Q1ZfSU5TTl9GVU5DUyhjX2JuZXosCTB4ZTAwMywgMHhlMDAxKTsKPiAgX19SSVNDVl9JTlNOX0ZV
TkNTKGNfZWJyZWFrLAkweGZmZmYsIDB4OTAwMik7Cj4gKy8qIFJWQyhTKSBpbnN0cnVjdGlvbnMg
Y29udGFpbiByczEgYW5kIHJzMiAqLwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19zcSwJMHhlMDAz
LCAweGEwMDApOwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19zdywJMHhlMDAzLCAweGMwMDApOwo+
ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19zZCwJMHhlMDAzLCAweGUwMDApOwo+ICsvKiBSVkMoQSkg
aW5zdHJ1Y3Rpb25zIGNvbnRhaW4gcnMxIGFuZCByczIgKi8KPiArX19SSVNDVl9JTlNOX0ZVTkNT
KGNfc3ViLAkweGZjMDMsIDB4OGMwMSk7CgpJbmNvcnJlY3QgbWFzay4KCj4gK19fUklTQ1ZfSU5T
Tl9GVU5DUyhjX3N1YncsCTB4ZmM0MywgMHg5YzAxKTsKPiArLyogUlZDKEwpIGluc3RydWN0aW9u
cyBjb250YWluIHJzMSAqLwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19scSwJMHhlMDAzLCAweDIw
MDApOwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19sdywJMHhlMDAzLCAweDQwMDApOwo+ICtfX1JJ
U0NWX0lOU05fRlVOQ1MoY19sZCwJMHhlMDAzLCAweDYwMDApOwo+ICsvKiBSVkMoSSkgaW5zdHJ1
Y3Rpb25zIGNvbnRhaW4gcnMxICovCj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX2FkZGksCTB4ZTAw
MywgMHgwMDAxKTsKPiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfYWRkaXcsCTB4ZTAwMywgMHgyMDAx
KTsKPiArX19SSVNDVl9JTlNOX0ZVTkNTKGNfYWRkaTE2c3AsCTB4ZTE4MywgMHg2MTAxKTsKPiAr
X19SSVNDVl9JTlNOX0ZVTkNTKGNfc2xsaSwJMHhlMDAzLCAweDAwMDIpOwo+ICsvKiBSVkMoQikg
aW5zdHJ1Y3Rpb25zIGNvbnRhaW4gcnMxICovCj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX3NyaSwJ
MHhlODAzLCAweDgwMDEpOwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19hbmRpLAkweGVjMDMsIDB4
ODgwMSk7Cj4gKy8qIFJWQyhTUykgaW5zdHJ1Y3Rpb25zIGNvbnRhaW4gcnMyICovCj4gK19fUklT
Q1ZfSU5TTl9GVU5DUyhjX3Nxc3AsCTB4ZTAwMywgMHhhMDAyKTsKPiArX19SSVNDVl9JTlNOX0ZV
TkNTKGNfc3dzcCwJMHhlMDAzLCAweGMwMDIpOwo+ICtfX1JJU0NWX0lOU05fRlVOQ1MoY19zZHNw
LAkweGUwMDMsIDB4ZTAwMik7Cj4gKy8qIFJWQyhSKSBpbnN0cnVjdGlvbnMgY29udGFpbiByczIg
YW5kIHJkICovCj4gK19fUklTQ1ZfSU5TTl9GVU5DUyhjX212LAkweGUwMDMsIDB4ODAwMik7CgpT
aG91bGRuJ3QgdGhlIG1hc2sgYmUgMHhmMDAzPwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
