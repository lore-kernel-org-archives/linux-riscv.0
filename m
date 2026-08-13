Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D4C5CFEB
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6PoPkVe5Z94RiNwpWHKDOHmBzP6QndTOnw6Up6YXbQ=; b=ZYBTMtqYGtSfQa
	145VLJZfXzPAo5R9Ffo4wYgIV5/3e2jG7VlM6Mx0cVigngjyu6NfbAp9WleEVVSRvgHGbp9EYAB6N
	7+chISYV4rAVTsT6CaXEq1+28ouaOahuORnVMMR4dspWXm9rbPt2jnMVcJPekqTVgSCUMyMiopD83
	/ItrDKKGouY3GDcb3XqhvrEDUDc5MSV7Xwp8UEXYJIcmWvz36QlzdPr/qWlunXAsS2fIK1rlDw3/K
	ga7jZGHO9nmiKKgHx8ohaDhzL8I3aUcqwuiR2GNiX//XXtJ9Pr/wUzY4acIQOn8EdCHnO9y4uHbRO
	ytAJbaKLI4BGCn/aceyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWCz-00000000pIf-0M9i;
	Thu, 13 Aug 2026 14:15:01 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWCw-00000000pHr-2T8O
	for linux-riscv@lists.infradead.org;
	Thu, 13 Aug 2026 14:15:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4815bce4652so421340f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Aug 2026 07:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786630495; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcK18znPq8NI1MIm53aMbaD/Lp7cylHRrfKzI07nqb0EXak+6drTImLC0hjYXTLUeK
         1giBG7ig5Bq4748j3l41PMGNkCFI0t7+F24SBgb06CL5cJ51R3bhO7juAaLb61tbFGxD
         tVCCmYnE8KDaqP8w4aJa0mfnFtzjwTfxlBVdRY20vaVSjGoXmya5jDOoX/8uRi3JCzn+
         LhVxFENJrvrJaWmimXxWxFtm4aW+bHjHX8ZdS7NFWbVkzm0CIFNVDn6W35sbyr8+2m87
         ZVDErxJf9lKBiIJAd7W0dnsaJ1337ZYmxqICDDGeYuc30/B49qeSNX3JLkIO5yGYhl2E
         G9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        fh=Qyg6HEgHSUk1+Bzdht+A+uK4nF2WXO0dwIFfqO6pYCM=;
        b=WYJJLSEfdpiwnqIG9W1UcSNQnVBZEcd7teEr73YknlXAdYTMpOpHXqX9Yviv0ua4xG
         +ILyWzoFZWo9TBKjEzv89b37Z78KJkd4nzWulONDQEbNdg3ce0UdyDo1ErCT8hU/Ii24
         wtv4JiSZ0X/DWTnBVSuRAUZVZ3vohZ4NRmtFxvWq3EDeq7yDignIxA4tYSGsFAYtfael
         z4yso6kp5cj7Ewx9PrWkk3hEElPov/0xlVOx33QBG3rhB8WQWHrA/bBRqxUzi/wDYtcm
         lPuVhk4z+8/L9NPgTx4fZRrcJ2KxIV5JzRaPHe95OG1YTQGMc3dMoLnnDyDBBIIqCuce
         GReA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786630495; x=1787235295; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        b=nCbixmA3lR4gLwItDJQv0lAOZOpTM52c4B60FpKtrUsBLJALBx5d8Yg8D2R6HzgoA0
         wqwWy1Y676ADKe27a2YwQ7dIMqbtngz/9w/xgIqCnk33gqlYV7uChrDfr3HUSPHrMSYN
         b00DTmmfX0bgMC5azuvhTTCN5KRGppo6qrs5WYAFOMBM7WqUt+pDRWq6wd5bVM12ZdG8
         cCIq5yg3yZwaoG82xXINepcq5M4fhjca31NecUzCVRfxwJyZWzyWotvRDVvku5Gd5ToP
         Kp6CU9UK2u4NweSF6J5xwdEYsOn21wkwDUx2tmDVp0gKB326V5epKAeHcECfh2iU/feI
         y7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786630495; x=1787235295;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwVYwS4rkKXuTd204iwL/N56ZQCMjhzJX1zTzeAwLag=;
        b=K8O/t4wl26Oz9BOqFn7i1DgCBopwf3yzYAHupuvJRbodEwZ/GpR3Tx3GDKl7vE6Qmy
         AgosXkATbgsFIII8F2YzqAmPhOVZMCkXR+Q+Z9bQyxCVmTaeJVrkiu1kZdck2grE4eDn
         RVbfLhboHVWOqXEtDUe3XNGwafUMdakfLdcUVx6leET9RGOnb9R34oqmkJUpxu5gfWSM
         lWJc2BrHmjWyv7Pf0I8H+k96u9cRW9XboMa7SU92F11gNHjwxw11ftw01oyDCJW3/rmm
         8JiwkiGt1qJBMFwunL7f70GJphwzHEnIGAbnGVNiXIaeA2ShyS1B+nv6ISj+KtCPNhbT
         qkbw==
X-Forwarded-Encrypted: i=1; AHgh+RqM8NNvfymtd0RSKStxHp+hCIBvYWy43+M253R1SJdKhXiX0xipvuicPAlgDd3oDC01QZuXOz0CJ+yvPw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrq2TWBE6MprkqkJXqQJPSztaHsFFak9/VjyrBCTnhaCsdU7GV
	FDZ6VlkPTDTdBebYi/UOyQS0F2aduKakmeQRpMzcPHzuA8OU/1x0NS/W7TPrJXqUoyZf3yZw63Q
	bfrzPy4YcDvBCX0XUAsVfzx+/Wa0/p5I=
X-Gm-Gg: AR+sD124DZXMBSf3Ku4uHDgBqfViOCjsT6g2cAUhyz4EPsymwfrePFP3FFbPRwvAQAV
	L+wRJVjJfDYPljJB4kKuy+Vz9c+fyfRj1FEH61/BHhfHcBhMDGJ7QPNio9xkDDa0UpuqQpNovgw
	I3eoNMV8vz8YOr+l1xZy71SPRsNrnvPQ7Q7zoS/bygshUCoXiWFjeqc4BGrWiYeepoWMJzHRn2r
	yCCjb7YpqExyh6YKMQnXBpX9za+QW+tOhWHFw94Tq3m3eWrZQCQL+p3Ne4bMUNJUQF2mrwyJSlj
	olfgIkHP0w3S4sBW1Ayh7sWuyfaqo+KrH2azTEZo7hJJVv7qG4TqjaPswaqVnaH8mpQbYA8T4j1
	Z9AayMX4Abi6zx4Eat5wTTH3oyZcp5Jb3heDOIj2aOcnnwr4RSN1T6zIJWqw5M/xO0wXplti+cX
	o=
X-Received: by 2002:a05:6000:29cf:b0:481:5829:3f28 with SMTP id
 ffacd0b85a97d-48159ed6b41mr6778867f8f.5.1786630495256; Thu, 13 Aug 2026
 07:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260720032258.5188-1-xiaofengmian@163.com> <20260720032258.5188-3-xiaofengmian@163.com>
In-Reply-To: <20260720032258.5188-3-xiaofengmian@163.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Aug 2026 15:14:26 +0100
X-Gm-Features: AUfX_mxkEJtvYLUcIuaN5m1I5DRHCK3p2rmLezGMhf-Znbx6IYzeyRitfT6Xq2w
Message-ID: <CA+V-a8tQK8rih9SGGTyqrEBGpNkx4H0eX2YccCRrgkVAPr+EBg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel text
 is already writable
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_071458_664970_E2298FD7 
X-CRM114-Status: GOOD (  22.52  )
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

SGkgWGlhb2ZlbmcsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIE1vbiwgSnVsIDIwLCAy
MDI2IGF0IDU6MTnigK9BTSBYaWFvZmVuZyBZdWFuIDx4aWFvZmVuZ21pYW5AMTYzLmNvbT4gd3Jv
dGU6Cj4KPiBDdXJyZW50bHkgcGF0Y2hfbWFwKCkgYWx3YXlzIGNyZWF0ZXMgYSB0ZW1wb3Jhcnkg
d3JpdGFibGUgbWFwcGluZyB2aWEKPiBmaXhtYXAgZm9yIGtlcm5lbCB0ZXh0IGFkZHJlc3Nlcywg
ZXZlbiB3aGVuIENPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWAo+IGlzIGRpc2FibGVkIGFuZCB0aGUg
a2VybmVsIHRleHQgaXMgYWxyZWFkeSBtYXBwZWQgd2l0aCBfUEFHRV9XUklURS4KPgo+IFRoaXMg
aXMgdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgYXQgYmVzdCwgYW5kIG9uIG1pbmltYWwgY29uZmlndXJh
dGlvbnMKPiBpdCBjYW4gY2F1c2UgcGFnZSBmYXVsdHMuCj4KPiBTa2lwIHRoZSBmaXhtYXAgcGF0
aCBmb3Iga2VybmVsIHRleHQgd2hlbiBDT05GSUdfU1RSSUNUX01PRFVMRV9SV1gKPiBpcyBub3Qg
ZW5hYmxlZCwgc2luY2UgdGhlIHRleHQgcGFnZXMgYXJlIGFscmVhZHkgd3JpdGFibGUgaW4gdGhp
cyBjYXNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhb2ZlbmcgWXVhbiA8eGlhb2ZlbmdtaWFuQDE2
My5jb20+Cj4gLS0tCj4gdjI6IGFkZCBjb21taXQgZGVzY3JpcHRpb24KPiB2MzogZWFybHkgcmV0
dXJuIHdoZW4gIUNPTkZJR19TVFJJQ1RfTU9EVUxFX1JXWCAocGVyIE5hbSBDYW8ncyBzdWdnZXN0
aW9uKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvcGF0Y2guYwo+IGluZGV4IDE2YjI0MzM3NmYuLmNhZWY0MWQ1ZWYgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L3BhdGNoLmMKPiBAQCAtNDQsMTUgKzQ0LDE2IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9p
ZCAqcGF0Y2hfbWFwKHZvaWQgKmFkZHIsIGNvbnN0IHVuc2lnbmVkIGludCBmaXhtYXApCj4gICAg
ICAgICB1aW50cHRyX3QgdWludGFkZHIgPSAodWludHB0cl90KSBhZGRyOwo+ICAgICAgICAgcGh5
c19hZGRyX3QgcGh5czsKPgo+ICsgICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19TVFJJQ1Rf
TU9EVUxFX1JXWCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBhZGRyOwo+ICsKPiAgICAgICAg
IGlmIChjb3JlX2tlcm5lbF90ZXh0KHVpbnRhZGRyKSB8fCBpc19rZXJuZWxfZXhpdHRleHQodWlu
dGFkZHIpKSB7Cj4gICAgICAgICAgICAgICAgIHBoeXMgPSBfX3BhX3N5bWJvbChhZGRyKTsKPiAt
ICAgICAgIH0gZWxzZSBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNUX01PRFVMRV9SV1gpKSB7
Cj4gKyAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZSA9
IHZtYWxsb2NfdG9fcGFnZShhZGRyKTsKPgo+ICAgICAgICAgICAgICAgICBCVUdfT04oIXBhZ2Up
Owo+ICAgICAgICAgICAgICAgICBwaHlzID0gcGFnZV90b19waHlzKHBhZ2UpICsgb2Zmc2V0X2lu
X3BhZ2UoYWRkcik7Cj4gLSAgICAgICB9IGVsc2Ugewo+IC0gICAgICAgICAgICAgICByZXR1cm4g
YWRkcjsKPiAgICAgICAgIH0KPgpXaXRoIHRoaXMgcGF0Y2ggYXBwbGllZCBhbmQgdXNpbmcgcmVu
ZXNhc19kZWZjb25maWcgSSBzZWUgYmVsb3cgT29wcwpvbiBTTUFSQyBSWi9GaXZlLgoKWyAgICAw
LjAxMjgxNF0gcHJpbnRrOiBsZWdhY3kgY29uc29sZSBbdHR5MF0gZW5hYmxlZApbICAgIDAuMDE3
NjM0XSBDYWxpYnJhdGluZyBkZWxheSBsb29wIChza2lwcGVkKSwgdmFsdWUgY2FsY3VsYXRlZAp1
c2luZyB0aW1lciBmcmVxdWVuY3kuLiAyNC4wMCBCb2dvTUlQUyAobHBqPTQ4MDAwKQpbICAgIDAu
MDI3OTE0XSBwaWRfbWF4OiBkZWZhdWx0OiAzMjc2OCBtaW5pbXVtOiAzMDEKWyAgICAwLjAzMzg3
Nl0gTW91bnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAyMDQ4IChvcmRlcjogMiwgMTYzODQK
Ynl0ZXMsIGxpbmVhcikKWyAgICAwLjA0MTM0M10gTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxl
IGVudHJpZXM6IDIwNDggKG9yZGVyOiAyLAoxNjM4NCBieXRlcywgbGluZWFyKQpbICAgIDAuMDQ5
NjM5XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsCmFk
ZHJlc3MgMDAwMDAwNmY4OWFiY2UwOApbICAgIDAuMDU3NjE3XSBDdXJyZW50IHN3YXBwZXIvMCBw
Z3RhYmxlOiA0SyBwYWdlc2l6ZSwgMzktYml0IFZBcywKcGdkcD0weDAwMDAwMDAwNDk0ZjkwMDAK
WyAgICAwLjA2NTYyNl0gWzAwMDAwMDZmODlhYmNlMDhdIHBnZD0wMDAwMDAwMDAwMDAwMDAwLApw
NGQ9MDAwMDAwMDAwMDAwMDAwMCwgcHVkPTAwMDAwMDAwMDAwMDAwMDAKWyAgICAwLjA3NDM1Ml0g
T29wcyBbIzFdClsgICAgMC4wNzY2MzVdIENQVTogMCBVSUQ6IDAgUElEOiAwIENvbW06IHN3YXBw
ZXIvMCBOb3QgdGFpbnRlZAo3LjIuMC1yYzctbmV4dC0yMDI2MDgxMiAjMjEgUFJFRU1QVApbICAg
IDAuMDg1NDk0XSBIYXJkd2FyZSBuYW1lOiBSZW5lc2FzIFNNQVJDIEVWSyBiYXNlZCBvbiByOWEw
N2cwNDNmMDEgKERUKQpbICAgIDAuMDkyMDk2XSBlcGMgOiBrbWVtX2NhY2hlX2FsbG9jX2xydV9u
b3Byb2YrMHgxYS8weDFiYQpbICAgIDAuMDk3NDE4XSAgcmEgOiBfX2RfYWxsb2MrMHg0Mi8weDE4
OApbICAgIDAuMTAxMTc3XSBlcGMgOiBmZmZmZmZmZjgwMTYyZTIwIHJhIDogZmZmZmZmZmY4MDE5
ODc0ZSBzcCA6CmZmZmZmZmZmODEyMDNiMzAKWyAgICAwLjEwODM4NV0gIGdwIDogZmZmZmZmZmY4
MTJlYzc1MCB0cCA6IGZmZmZmZmZmODEyMGM3ODAgdDAgOgpmZmZmZmZkNjAxODlkYjE4ClsgICAg
MC4xMTU1OTNdICB0MSA6IDAwMDAwMDAwMDAwMDAwMTQgdDIgOiAwMDAwMDAwMDE2ZTAwNDAzIHMw
IDoKZmZmZmZmZmY4MTIwM2I5MApbICAgIDAuMTIyODA5XSAgczEgOiBmZmZmZmZkNjAxODk1ODAw
IGEwIDogODlhYmNkZWY4OWFiY2RlZiBhMSA6CmZmZmZmZmQ2MDE4OTVkMTAKWyAgICAwLjEzMDAy
Ml0gIGEyIDogMDAwMDAwMDAwMDAwMGNjMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDIgYTQgOgpkZWFk
NGVhZDAwMDAwMDAxClsgICAgMC4xMzcyMzVdICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAw
MDAwMDAwMDFkZTM1MjFiIGE3IDoKZmZmZmZmZmZhYzdmNGEwYwpbICAgIDAuMTQ0NDQ4XSAgczIg
OiAwMDAwMDAwMDAwMDAwMDAwIHMzIDogZmZmZmZmZDYwMTg5NTgwMCBzNCA6CjAwMDAwMDAwMDAw
MDAwMDAKWyAgICAwLjE1MTY2MF0gIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IGZmZmZmZmZm
ODEyZWQwMTggczcgOgowMDAwMDAwMDAwMDAwM2U4ClsgICAgMC4xNTg4NzJdICBzOCA6IDAwMDAw
MDAwMDAwMDAzZTYgczkgOiAwMDAwMDAwMDAwMDAwMDAwIHMxMDoKMDAwMDAwMDA3N2YyOTM0MApb
ICAgIDAuMTY2MDg0XSAgczExOiAwMDAwMDAwMDAwMDAwMDAwIHQzIDogZmZmZmZmZmZhMGFlZDAy
MiB0NCA6CjAwMDAwMDAwMDIwMThlZmIKWyAgICAwLjE3MzI5N10gIHQ1IDogMDAwMDAwMDAxMDFk
NTIwMCB0NiA6IGZmZmZmZmZmODEyMDNiNjggc3NwIDoKMDAwMDAwMDAwMDAwMDAwMApbICAgIDAu
MTgwNTk2XSBzdGF0dXM6IDAwMDAwMDAyMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwNmY4OWFiY2Uw
OApjYXVzZTogMDAwMDAwMDAwMDAwMDAwZApbICAgIDAuMTg4NTAyXSBbPGZmZmZmZmZmODAxNjJl
MjA+XSBrbWVtX2NhY2hlX2FsbG9jX2xydV9ub3Byb2YrMHgxYS8weDFiYQpbICAgIDAuMTk1MTE2
XSBbPGZmZmZmZmZmODAxOTg3NGU+XSBfX2RfYWxsb2MrMHg0Mi8weDE4OApbICAgIDAuMjAwMTcx
XSBbPGZmZmZmZmZmODAxOTg4ZmU+XSBkX2FsbG9jX2Fub24rMHhlLzB4MTYKWyAgICAwLjIwNTMx
NF0gWzxmZmZmZmZmZjgwMTk4YzkwPl0gZF9tYWtlX3Jvb3QrMHgxOC8weDNhClsgICAgMC4yMTA0
NTddIFs8ZmZmZmZmZmY4MDEyNzkyYT5dIHNobWVtX2ZpbGxfc3VwZXIrMHgyMTgvMHgyNDQKWyAg
ICAwLjIxNjIxMF0gWzxmZmZmZmZmZjgwMTg2NWFhPl0gdmZzX2dldF9zdXBlcisweDQyLzB4NzAK
WyAgICAwLjIyMTUyNV0gWzxmZmZmZmZmZjgwMTg2NWU4Pl0gZ2V0X3RyZWVfbm9kZXYrMHgxMC8w
eDE4ClsgICAgMC4yMjY5MjVdIFs8ZmZmZmZmZmY4MDEyNWU2YT5dIHNobWVtX2dldF90cmVlKzB4
MTQvMHgxYwpbICAgIDAuMjMyMzI3XSBbPGZmZmZmZmZmODAxODQ1YmE+XSB2ZnNfZ2V0X3RyZWUr
MHgxYS8weGIwClsgICAgMC4yMzc1NjFdIFs8ZmZmZmZmZmY4MDFhMWZhMj5dIGZjX21vdW50KzB4
MTAvMHgzMgpbICAgIDAuMjQyNDQ1XSBbPGZmZmZmZmZmODAxYTIwMTY+XSB2ZnNfa2Vybl9tb3Vu
dC5wYXJ0LjArMHgzNC8weDVjClsgICAgMC4yNDg0NTFdIFs8ZmZmZmZmZmY4MDFhMjA0Yz5dIHZm
c19rZXJuX21vdW50KzB4ZS8weDFhClsgICAgMC4yNTM3NjRdIFs8ZmZmZmZmZmY4MDFhMjA2Yz5d
IGtlcm5fbW91bnQrMHgxNC8weDI2ClsgICAgMC4yNTg4MThdIFs8ZmZmZmZmZmY4MDgwZjcwYT5d
IHNobWVtX2luaXQrMHhiZS8weDE1MApbICAgIDAuMjYzOTYzXSBbPGZmZmZmZmZmODA4MTk3M2U+
XSBtbnRfaW5pdCsweDEyOC8weDMxNApbICAgIDAuMjY5MDIwXSBbPGZmZmZmZmZmODA4MTkzMTY+
XSB2ZnNfY2FjaGVzX2luaXQrMHhhMC8weGNlClsgICAgMC4yNzQ1MDddIFs8ZmZmZmZmZmY4MDgw
MGZhMj5dIHN0YXJ0X2tlcm5lbCsweDc1NC8weDdhYwpbICAgIDAuMjc5OTIzXSBDb2RlOiAxMDgw
IGUwY2EgZWM4NiBmYzRlIGY4NTIgMzc4MyA1NDAyIDM0MjMgZmNmNCA0NzgxCig2NzgzKSAwMWM1
ClsgICAgMC4yODczNDRdIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQpbICAg
IDAuMjkxOTg2XSBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogQXR0ZW1wdGVkIHRvIGtpbGwg
dGhlIGlkbGUgdGFzayEKCgpSZXZlcnRpbmcgdGhpcyBwYXRjaCBmaXhlZCB0aGUgaXNzdWUuCgpD
aGVlcnMsClByYWJoYWthcgoKCj4gICAgICAgICByZXR1cm4gKHZvaWQgKilzZXRfZml4bWFwX29m
ZnNldChmaXhtYXAsIHBoeXMpOwo+IC0tCj4gMi40My4wCj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
