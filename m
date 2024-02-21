Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDC7C5475B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5A/GCUB7WYSiV5tizn2gCw2A17FAJOe2aaPFjUJRtag=; b=ui3KHEOU19LbtT
	5Mt0ncGqwCKekN3BMModlDJq+0UmNVDeLLWMztgzAzvno7qChTDUmv5rFYXuPln5xPSgYqYq2Yzqu
	Jfet7o/zNr3QoO9OkF2QsPo+Z9HurRytt2Sss0w8r9vreR49cS6v093YMciLi2rUBbZoHoI32LkU5
	/NX8v4nFcnZmVrtBJjJmn5eSo/KzrGMPTMtX+e+PRRmX4J5VCzOQu9LicCH0gkJj9tzshnh4fxL3l
	2mer3xx1HrB/jIVWcUq+/qP3bfNxl4p96/Xfh8slaneiRwJ7pqZyFK2vWZTmy/q7hmTgKCaEYfz0P
	Vzv0BxKaEZxOogFEJohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchcx-000000000l6-245J;
	Wed, 21 Feb 2024 08:06:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchcv-000000000ki-0s9t
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 08:06:50 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33d1f3144c4so593476f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 00:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708502806; x=1709107606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAp5EJfwMAx3N+LtvfX8uYtr5+xL1bjdXnqMcz/4K3g=;
        b=CIFj5lhGY9L2sMYlAVB6C0BUY06RaxuWgdKcCVs40AeCyTz+4B2qYlo6t0bl3hYTAa
         I/Py/MEzLyoZ0/PQkOEA8ECCoKE7BRlDsgJSSRlaVprjWg+k9gGv1ft24S6LDMUjgwq3
         hUmIJIfgpS0LqvxlaSVvDNcvUIG3PzxrVP4a0JqGqTVM4FgVP2sPMS88dvoySMrhhfMM
         oBU/ZuoSwYznNlyBPegeg2ZTUK5TrAbf42Uo8fNaPvETuvsLuyRlY32MoEfqcWeZTqPK
         l2VdQu5dUY03ViQGp3pHifvOBvfdhIEfrZTSiJmx1x3GV06Gm1LLAqYCp4B5W8yuWHy6
         xQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708502806; x=1709107606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAp5EJfwMAx3N+LtvfX8uYtr5+xL1bjdXnqMcz/4K3g=;
        b=dImUhcTE/vmOC7y7PZeYh60fH3QQKvXczoW8UW6DUDSdzVXzSu+SobBLf6Z1OsSCXD
         xq54lb6qA0zItWZxieepd5jMlP8b6aIjjbmADoGWBTVP6/pkgt5fc1AGHNUC3bBb+WN7
         6c9YCt3oN/S7U9DwFHoNmdoHI9NBCix6DlVV2kazJ1tQIOQb120rX7FmOD7FyRG9fJLj
         Z3TtzA8Fxivgo/x9MDFUrNJlSO7mW1o1sSk7uEFtvAi6ZEHkuNCW8D3uEfayU7wq/4m4
         lGD4GHlNM4IW0uyXojPE488PCO6e9dwYv9rLnNRgK8AaVNzJdVVWZTmIggYvXOUUf4T2
         gxYA==
X-Forwarded-Encrypted: i=1; AJvYcCVIvaAJVqm9xPnRrkusB0LtwqxmKo6dpWP4kzWpkzfzqeYaIapaWSArPFD93tj0fDPc7aPBFZzAkWkK9iT7XP3ZGfSUmOiJ2+Oi0hzqWBlG
X-Gm-Message-State: AOJu0YzwSLH6pNhdroZhNfw5IaK6piAlPJzePLYa9XzAvHTAAYrYgHaz
	S0EH7B1drFvTPzXZlx0px39aTzVIgoUA0Bt5ceCdtMETog6IAFnEn0YamLV5iuI=
X-Google-Smtp-Source: AGHT+IFhhuo+eJPWSLWQq+dZbJmeLfckVhpVthonWGbWlj64bYNPwd9tHXCUdOlo32NdqDMLAdPZBQ==
X-Received: by 2002:a05:600c:1587:b0:412:5670:ef62 with SMTP id r7-20020a05600c158700b004125670ef62mr8238941wmf.1.1708502806057;
        Wed, 21 Feb 2024 00:06:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2? ([2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b00410bca333b7sm1629488wmq.27.2024.02.21.00.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 00:06:45 -0800 (PST)
Message-ID: <2b667310-6bb4-45fa-9c11-098c532e6a7c@rivosinc.com>
Date: Wed, 21 Feb 2024 09:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robbin Ehn <rehn@rivosinc.com>
References: <20240219154905.528301-1-cleger@rivosinc.com>
 <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_000649_481405_B1F74033 
X-CRM114-Status: UNSURE (   5.44  )
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

CgpPbiAyMS8wMi8yMDI0IDAwOjQyLCBBdGlzaCBQYXRyYSB3cm90ZToKPiDCoMKgwqDCoMKgwqDC
oMKgIGR1cmluZyBzaWdub2ZmIikKPiDCoCArwqAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9F
WFRfWklISU5UUEFVU0VgOiBUaGUgWmloaW50cGF1c2UKPiBleHRlbnNpb24gaXMKPiArwqDCoMKg
wqDCoMKgIHN1cHBvcnRlZCBhcyBkZWZpbmVkIGluIHRoZSBSSVNDLVYgSVNBIG1hbnVhbCBzdGFy
dGluZyBmcm9tCj4gY29tbWl0IGNvbW1pdAoKTG9va3MgbGlrZSBJIGRpZCBhIHR5cG8gKCJjb21t
aXQiIHR3aWNlKS4gTGV0IG1lIHNlbmQgYSBWMi4KCkNsw6ltZW50Cgo+ICvCoMKgwqDCoMKgwqAg
ZDhhYjVjNzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0aWZpZWQiKS4KPiArCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
