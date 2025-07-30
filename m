Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4B5C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DG34SvvG8t5fexShJO1CpheCDKX3PI8u18MCxwghMnw=; b=FIlhAD+jfzO9oe
	4/E2dZXytr2XloadpFDaO+AgDL257O9kb/QgqUTRlOfawLCQolinAjHINELw5OFCH6QbpW332S+8b
	uEOM+Y+Cr+n1Z8T2d3ZXg6K8j7bqoOCnj+BHVxhntkvoqFnnA6Irdm8TVRjukH/vXhQeoWn4b1aB3
	CJkqY2dP2+NuSi4qoE+dY15CFL2qGq3eFyD8oIKGLJAZuu5Wz1UfZI52LU76ZrToPcZ3/nD5OPZdP
	OtmiCB/2uH+3Ut7kCBkOs2zIF3WC8uE3m8NKGllgzQ4gW8EM9O70WuHVeG2wqER46NAkILlCDThOX
	As1/vxZHpjQ/ewI4+cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhB67-00000002ASq-3oe4;
	Wed, 30 Jul 2025 18:00:15 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhB64-00000002AP8-1vSi
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 18:00:14 +0000
Message-ID: <b8f3af23-045f-43e7-9a8c-542260475bb5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753898386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VW/BbcE/dRv8R6j5WaC4ie7Am1IRMypmai1xYtZozrU=;
	b=cq4DT2nuwaBQdHxE9QBVlTuAbH83Jnxz5TcBDMUUYq5z2mwUzvySKgE+sSRNt5Y0ZSOzLj
	F+5/hpOaidn+rVbezTQ/LgPh7cQsPwF4THj0HfxWKnBsa8d5v293dgajL0dZqn8e2GocOl
	MAn/VSK9dweWsBeQw+7JM6UxiABeSTM=
Date: Wed, 30 Jul 2025 10:59:30 -0700
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Subject: =?UTF-8?Q?CFP_Now_Open=3A_RISC-V_Microconference_at_LPC_2025_=28Tok?=
 =?UTF-8?B?eW8sIERlYyAxMeKAkzEzKQ==?=
To: linux-riscv@lists.infradead.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_110013_271129_02D95BB1 
X-CRM114-Status: UNSURE (   1.95  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgZXZlcnlvbmUsCgpUaGUgQ2FsbCBmb3IgUHJvcG9zYWxzIGZvciB0aGUgUklTQy1WIE1pY3Jv
Y29uZmVyZW5jZVsxXSBhdCBMaW51eCAKUGx1bWJlcnMgQ29uZmVyZW5jZSAyMDI1WzJdIGlzIG5v
dyBvcGVuLgpEb27igJl0IG1pc3MgeW91ciBjaGFuY2UgdG8gc3VibWl0IGEgdG9waWMgcHJvcG9z
YWwhCgpLZXkgZGV0YWlsczoKCiAgKgoKICAgIFN1Ym1pc3Npb24gZGVhZGxpbmU6IFNlcHRlbWJl
ciAyOSwgMjAyNQoKICAqCgogICAgU3VibWlzc2lvbiBsaW5rOiBodHRwczovL2xwYy5ldmVudHMv
ZXZlbnQvMTkvYWJzdHJhY3RzLwogICAgKE1ha2Ugc3VyZSB0byBzZWxlY3QgdGhlICJSSVNDLVYg
TUMiIHRyYWNrIHdoZW4gc3VibWl0dGluZy4pCgogICoKCiAgICBDb25mZXJlbmNlIGRhdGVzOiBE
ZWNlbWJlciAxMeKAkzEzLCAyMDI1IChUaHVyc2RheSB0byBTYXR1cmRheSkKCiAgKgoKICAgIExv
Y2F0aW9uOiBUb3Jhbm9tb24gSGlsbHMgRm9ydW0sIFRva3lvLCBKYXBhbgoKICAqCgogICAgRm9y
bWF0OiBIeWJyaWQgKGluLXBlcnNvbiBhbmQgcmVtb3RlKS4KICAgIEhvd2V2ZXIsIHdlIHN0cm9u
Z2x5IGVuY291cmFnZSBwcmVzZW50ZXJzIHRvIGF0dGVuZCBpbiBwZXJzb24gdG8KICAgIG1pbmlt
aXplIHRlY2huaWNhbCBpc3N1ZXMgYW5kIHN1cHBvcnQgZGVlcGVyIGRpc2N1c3Npb25zLgoKRHVl
IHRvIGxpbWl0ZWQgdGltZSBzbG90cywgdG9waWNzIHdpbGwgYmUgYWNjZXB0ZWQgb24gYSByb2xs
aW5nIGJhc2lzLCAKc28gZWFybGllciBzdWJtaXNzaW9ucyBhcmUgZW5jb3VyYWdlZC4KCkxvb2tp
bmcgZm9yd2FyZCB0byB5b3VyIHByb3Bvc2FscyBhbmQgc2VlaW5nIG1hbnkgb2YgeW91IGF0IExQ
QyAyMDI1LgoKQmVzdCByZWdhcmRzLApBdGlzaAoKWzFdIApodHRwczovL2xwYy5ldmVudHMvZXZl
bnQvMTkvY29udHJpYnV0aW9ucy8/Y29uZmlnPTM2N2EzYmRmLTc0MDUtNDhjNS1hOGJlLWJkYTgx
MGMyODI5NwpbMl0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE5L3BhZ2UvMjQ0LWxwYy0yMDI1
LW92ZXJ2aWV3CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
