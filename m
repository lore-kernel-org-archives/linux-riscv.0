Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC9C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 08:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9O0Tv09P4zpHGZmPz9SsxWQQ8nlg6s3NtTgeRH+aCw=; b=iq7nauXuLdL0u1
	/PjmjzbSST9u4vUVSWJTkrv5u5uazFiKi1luJU62/p9gvJD0zvHJTG9tj517sUb6UWSXhlt8yxLxg
	Hh+GQu/F2qVt9neijWe24OMPHYYXu8GEfEL1APQ0x2bF88CrknUnSd0kq777H1Ie3NOC+XAEKpYYL
	JNmL1cgulwpzwMRxVON0Od4ww0rPKvhpWn6jxcT+Z8uXpVwde+LDDgPPwLjCXw66rl0Rzfrz2l6cB
	gndcXnYmVq+PQvTIMzfoir2r+5D9YNmQxa+QiRvDYzC9RjVkKKTpQkq8/kKhpvPNMojTXp2v8eFFW
	5eaey53vV+S1aXOG9etg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMac-0000000AEuO-1ASl;
	Tue, 03 Jun 2025 08:01:42 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMMX7-0000000AEDk-3axg
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 07:58:08 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 530C227801; Tue,  3 Jun 2025 09:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1748937345; bh=DjNALEe96gRlzA4ffLINmOD2oI1cqzpVK/E4I+uckvQ=;
	h=Date:From:To:Subject:From;
	b=N3TWyZY0VDXwe6T2VKbwkMhc527w0tamZzKmR84LC/gMWuloYApeQhXrRQ7mVGSZF
	 KgWZE4/gnn7nwAcvls8fn5tH2loU8rqReZnNmD+geRM3gA9f/p1lBJjbVPoBPZ4nFp
	 zbgX57HRfnfBvLutkCQ5RbF324Nb49eF8mMktAy1IG6ex3vTdfOntGNux80ErkGUNv
	 bNQViMrACCNYkiZ6nc9aMxgrf+wyFpoJv4nw+nK7utNOtkc5+V4akXv952xOliZWuD
	 +VvnxoEN9SVqefDYoA+CVH3d0MgCpVf398Scj4QwwBZnqtExz2CSoWsw8J3hr5KTey
	 0B6IMEHqN3fcg==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Tue,  3 Jun 2025 07:55:11 GMT
Message-ID: <20250603084500-0.1.hn.unv6.0.a7289docab@biznator.pl>
Date: Tue,  3 Jun 2025 07:55:11 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_005806_609263_D4A98754 
X-CRM114-Status: UNSURE (   0.38  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhwoKClBvemRyYXdpYW0KV29qY2ll
Y2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
