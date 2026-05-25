Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2322DCD5BC0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 06:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+Zl8Vr9kArjZW7Z2VlArPI7Kl3qJnqfHBqatkaRVaw=; b=bbZCw3qhvjZj1J
	zEe9+qJW04/15k5krD53eAX/b5t4/tkxivrbSZsx8ICpBSVYMZp8a0T0pX6SdG54+UFpoVLtynf36
	ewABRUby5AdRzJ4Ug4smrv0v3vJXHP9DOjnj1et/q7Jf1f9B2XLuz/TQ71CUtOTksTg2aitzmVJh3
	MlN0bgzVjrm0UDOPvHhi+kRwznWZrqm1rGp1jf6o8DYGFUsCINJttCgaWRfmdqSmzro6kWiUn2ihT
	MxIu3ulMnBG05QKObK5mm7JpfrpIB36PeKtMqd8dBGhS3yW/hOw/6R/cBZChLafzqvkddv0bwVlS+
	s355vf5IeS8yyCi0K76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRORg-0000000GNip-2kZY;
	Mon, 25 May 2026 06:05:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRORe-0000000GNiC-404M
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 06:05:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJFvdZ253167
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 06:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=0m8zTAYDEiVM0XLZgjIUa0BVssyY1lfaYhWeExB/N/A=; b=ar
	QyRi8BfYskQCd4kegmQpAqT8FselhseQuLnniC530aApI5YU0RE0qQajtCe6hUo1
	B5WDrzPKyd7kpk8PqZzlDonqC6cwPcp0jy5xeMT8MC/IdpQS9xor/x0C9yI+mNzv
	VnZMRmuvBIOo88Si/pCS4zctJ+AI89N+CKv9u50pXAmoycl4yVRSDE1FOYEWBQFK
	YU2spcbZhNKKyG7y9cFGbmEysDkE+0DbgZW4jzJUo5jCLZw/J5nTYprfbvt/PG3K
	OeUxsgaeqoJQF92jzr81CSzFQDt2GmMs/AKSLZXoA0KIObx+VvlnBLwcpCpBApkH
	YWbaD96a5nt52wC7spjA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9n15v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 06:05:45 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-65c53d7c36bso15531044d50.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 May 2026 23:05:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779689145; cv=none;
        d=google.com; s=arc-20240605;
        b=C+UA+PuzGF2zq6zuOwMpKySvi+iC4/0LXfCEeAjYQhtQCeIgd58L7bz55LHHnouZoI
         SnM5IKk4aNrozpY7AL9D9bp3a3S+6gIzhK4r/3aNouJcuaPCywh+BO+ekoOXhs21Cn6S
         uZgEUif4+sBCY0prJEay1a2Cce5HxFDfgpglRvaF0uZt+QCRfg79PqoKzYeAAtDgh/4O
         TI23souqBydH+orplZKA3YUpRP3aBWK1E/9TU5ARfwPmLaehF68NPOAfDJxriTYbhRdG
         vNUwPvT0dREt12hMwxgJYXHQ5jPK4aSpA2V6ja/i04G66hmdKKEf5nJDzPdBFXU4Z+yr
         Hy5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=0m8zTAYDEiVM0XLZgjIUa0BVssyY1lfaYhWeExB/N/A=;
        fh=OUqsDCFMknRri3HLdE/tto2Dyxv5YQmlJD0KX6uWYgE=;
        b=GWksxo0+AiBCQzu9fANr3q4V3O2KfW9lwArBbGAZLdxll+AZFC7cNT1pD/ZoSK17x2
         //PWZj/2IF6E9r1r+G1fUGFs/0V6CQVhHDe/fmQq2xszHwnEEJ5xgs2jSsv4eEBmknx3
         XmKi6GlTQ4fFBwPN6L+oAxnBX7ncW7qe9pS/+pngQ2CyoL3Zt3FHSAdyRyFuR9tEIb3Z
         aHQTZbvYEHkCYXmRKt2T/gtiwpoy/uMHrZBqghinbp57gsKUBgBhAK253x27ReRrxW3U
         lAvBW2MhKsQMfGCcvS3sej3VEPv4mwYUfYCdZrw81mAg4u4wYj51zCAxhR1dTJ1For7t
         YXeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779689145; x=1780293945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0m8zTAYDEiVM0XLZgjIUa0BVssyY1lfaYhWeExB/N/A=;
        b=NNp5JMRApQ9qIh6px+0KF3or0tD3OL5/Q4ZIqxFA+c9p+OISg64tsVrxfxGK66byMa
         qe7Rkpcv0yLbW5GXQeEDQJb1qgFmGmgvzMsc7IvUXImfoW8V18p22+Zj6MSVjP9VBw8M
         Xhe7T502BvBgKZkOAwxBW7WP4EJMbu9ZHLMQKeC1nLN3oByiO4heRE5XTpUBBPeT2yXC
         j/Jz23dYlS5n0uhO9alYqZXvr+nunf1PSAwtwHsdpOQsTz+tOisIzQS/iIdkmwTOdpEM
         xRQORrod9BGDqZyrPowrGbaZPluTIAm7y+cH7IAAe6d0zWxcgBgx3Z3nKHGX8c7RpkYI
         Y3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779689145; x=1780293945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0m8zTAYDEiVM0XLZgjIUa0BVssyY1lfaYhWeExB/N/A=;
        b=k5c+fDk5Py3mKr6zczOm4k/1CDQ4PiOyue32QScg0CeWSI8kREz1BbMXT9rb7CcT42
         r3kYUUCcwGP/60bfwg0KOcW2DApmk+gECXUs3E9vHmbLzJnV8q7Beq6YnqShQaers7rj
         HzR6ExAaddoQHkUih9Zuqq9IfSE64eAzimIOwxQeDmyf5NQszKB2L3WD6lln22sR4g/g
         hFdCRmqHc7nPxv5z+eToCG9lwJ2bdv0MgW869dsVP1d9vkINuL1IbDikqRJtPu1FU2eb
         PC0epMomlJGt7CbCEe9SqVYZFQnR7v8G4sT6BatL4x/2zwAbD3eAAY5ZhPBIoTATEMkc
         Jwxw==
X-Forwarded-Encrypted: i=1; AFNElJ8jJC4bB2rjic1aGHuYmcYEV6ltn/IL2QKwdtBr5laKzXPiMhl7QlioVr6YhFeFu/EcFjtaqGwPL335eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwONf/qrJg0JP/fU3Py/tmKJK2mqnoB4aewvjcXGElERU4AkKuo
	JEQ/ddLDw65KBdeyetZ+198D328JSwMpwalxjT7sOPGt6NUXlaWLFDt6l8LQo00ql9zgKAVnOek
	LfiBf84KP18ZlSSKGjWnbh14WiEg2rPEPz9O9dLhBuXC3/Iij1LnHiGtkCxR22VqbxURXtbI+Z9
	eC3oZbfPOnCoWiCP2pX7v3LfdO15zuXHiE6kuPnHQ3JOMBsQ==
X-Gm-Gg: Acq92OEXsrJtEZdabc9tl7pGYVySlLUMkHwSQaVv80tg001gKe/McxZhYGDFtPJJjit
	W6GPATNRaj58MMrG9IwnkdaCFm3nqICGSogP8k4AweGr3U+5YCUxc4pIWikGnqkJtL6DhVN+wtx
	oEg/bvsOEyi0LDpX+iZS7IMerZgTsYk2xVkY1fsKcN4150otvhs6JSR+mgP3TMxKtSCQFW6nUTb
	T5YtRiT
X-Received: by 2002:a05:690e:d4a:b0:65c:2738:c6ad with SMTP id 956f58d0204a3-65ec97cb3ddmr14519398d50.17.1779689144663;
        Sun, 24 May 2026 23:05:44 -0700 (PDT)
X-Received: by 2002:a05:690e:d4a:b0:65c:2738:c6ad with SMTP id
 956f58d0204a3-65ec97cb3ddmr14519366d50.17.1779689144283; Sun, 24 May 2026
 23:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260519090928.1952787-1-maoyixie.tju@gmail.com>
In-Reply-To: <20260519090928.1952787-1-maoyixie.tju@gmail.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 25 May 2026 11:35:33 +0530
X-Gm-Features: AVHnY4IRGuUiYnMe6dXGsX3It310HZfoQGBbPW7POERO3lN-yzhhJmRuZt_XgQ8
Message-ID: <CAB19ukFfwjJEyE0MX+u7zK8TO0g_AKen1AAF-ig4NH3-aHWgQQ@mail.gmail.com>
Subject: Re: acpi/riscv: iterator after loop end in riscv_acpi_register_ext_intc?
To: Maoyi Xie <maoyixie.tju@gmail.com>
X-Proofpoint-ORIG-GUID: t8qGBihNBjp6YRVL5mGiEfakV0Kzu4jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA1OCBTYWx0ZWRfX0XoEZiPhvyp9
 2Z3AB4LF1rrITDxfgnhHdwWEB0TBO38ys5lfkxLMf5Be9JDvwpWrr7sJTPDvNWMehTcIIO/WnAs
 MsedQ0Aqb27lzUGsDTwMqUZPdgdajG2fE2wzsIfbZcqsRKs1GK3fi4Dz9Ddnagr4t6ilFyuRfbu
 SaTl2tVGVNCRVIvqMMqoTvVhKLQ5T6uNEfRT7uvdxPNOsYWe65CviJYdOkuc7JlUO7TF0Em0t2E
 EJOdR5fvsKNRgZZlP21JWQbi8VIwfO+v7DYOt/X1XhuPx0YMhYtIh3k6DACuhk5xw4daAKGoz0l
 eMrpe8TKk+t+H8WKzSJpVqy3py7C29fn90egDdpQYxEtvTGs9WXV10LaTXXmb8TJYCstOrUXuHF
 7l2ciOVl4+WBqc/2KDs5zzzRycGejVecMcCMQzj/wt45tXcNXBgTmzZfYdbQmSdScBFShvwxZOP
 p6eeB9+nFSRq1m2Cbxw==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a13e6b9 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=9prIHcOmAL0soUL90jwA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22 a=zY0JdQc1-4EAyPf5TuXT:22
X-Proofpoint-GUID: t8qGBihNBjp6YRVL5mGiEfakV0Kzu4jf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_230547_006133_A1D8DDC0 
X-CRM114-Status: GOOD (  30.73  )
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
Reply-To: sunilvl@oss.qualcomm.com
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWFveWkgWGllLAoKT24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMjo0MOKAr1BNIE1hb3lpIFhp
ZSA8bWFveWl4aWUudGp1QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBhbGwsCj4KPiBXaGlsZSBy
ZWFkaW5nIGRyaXZlcnMvYWNwaS9yaXNjdi9pcnEuYyBJIG5vdGljZWQgc29tZXRoaW5nCj4gdGhh
dCBsb29rcyBsaWtlIGEgcGFzdCB0aGUgZW5kIGl0ZXJhdG9yIHBhdHRlcm4sIHVzZWQgaW4gdHdv
Cj4gcGxhY2VzIGluIHRoZSBzYW1lIGZ1bmN0aW9uLiBJIHdvdWxkIGFwcHJlY2lhdGUgaXQgaWYg
eW91Cj4gY291bGQgdGFrZSBhIGxvb2sgYW5kIGxldCBtZSBrbm93IHdoZXRoZXIgdGhpcyBpcyBh
IHJlYWwKPiBpc3N1ZSwgYW5kIHdoZXRoZXIgaXQgaXMgd29ydGggZml4aW5nLgo+Cj4gVGhlIHNp
dGUgaXMgcmlzY3ZfYWNwaV9yZWdpc3Rlcl9leHRfaW50YygpIChsaW51eC03LjEtcmMxLAo+IGFy
b3VuZCBsaW5lIDE1NSk6Cj4KPiAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeShub2RlLCAmZXh0X2lu
dGNfbGlzdCwgbGlzdCkgewo+ICAgICAgICAgICAgIGlmIChub2RlLT5nc2lfYmFzZSA8IGV4dF9p
bnRjX2VsZW1lbnQtPmdzaV9iYXNlKQo+ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAg
IH0KPgo+ICAgICAvKiBBZGp1c3QgdGhlIHByZXZpb3VzIG5vZGUncyBHU0kgcmFuZ2UgaWYgdGhh
dCBoYXMKPiAgICAgICAgcGVuZGluZyByZWdpc3RyYXRpb24gKi8KPiAgICAgcHJldiA9IGxpc3Rf
cHJldl9lbnRyeShub2RlLCBsaXN0KTsKPiAgICAgaWYgKCFsaXN0X2VudHJ5X2lzX2hlYWQocHJl
diwgJmV4dF9pbnRjX2xpc3QsIGxpc3QpKSB7Cj4gICAgICAgICAgICAgaWYgKHByZXYtPmZsYWcg
JiBSSVNDVl9BQ1BJX0lOVENfRkxBR19QRU5ESU5HKQo+ICAgICAgICAgICAgICAgICAgICAgcHJl
di0+bnJfaXJxcyA9IGV4dF9pbnRjX2VsZW1lbnQtPmdzaV9iYXNlCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLSBwcmV2LT5nc2lfYmFzZTsKPiAgICAgfQo+Cj4gICAgIGxp
c3RfYWRkX3RhaWwoJmV4dF9pbnRjX2VsZW1lbnQtPmxpc3QsICZub2RlLT5saXN0KTsKPgo+IFdo
ZW4gdGhlIGxvb3Agd2Fsa3MgYWxsIGVudHJpZXMgd2l0aG91dCBicmVhayAobm8gZW50cnkgaGFz
Cj4gZ3NpX2Jhc2Ugc21hbGxlciB0aGFuIHRoZSBuZXcgb25lKSwgbm9kZSBpcyBwYXN0IHRoZSBl
bmQuCj4gVGhlIGZ1bmN0aW9uIHRoZW4gdXNlcyBub2RlIGluIHR3byB3YXlzOgo+Cj4gICAxLiBs
aXN0X3ByZXZfZW50cnkobm9kZSwgbGlzdCkgcmVsaWVzIG9uICZub2RlLT5saXN0Cj4gICAgICBh
bGlhc2luZyAmZXh0X2ludGNfbGlzdCAodGhlIGhlYWQpIHZpYSBjb250YWluZXJfb2YKPiAgICAg
IG9mZnNldCBjYW5jZWxsYXRpb24sIHNvIHRoZSByZXN1bHQgYmVjb21lcyB0aGUgbGFzdAo+ICAg
ICAgcmVhbCBlbnRyeSBvZiB0aGUgbGlzdCAoaGVhZC0+cHJldikuIFRoZSBQRU5ESU5HIGZsYWcK
PiAgICAgIGFkanVzdG1lbnQgdGhlbiBydW5zIG9uIHRoYXQgbGFzdCBlbnRyeS4KPgo+ICAgMi4g
bGlzdF9hZGRfdGFpbCguLi4sICZub2RlLT5saXN0KSByZWxpZXMgb24gdGhlIHNhbWUKPiAgICAg
IGFsaWFzIHNvIHRoZSBpbnNlcnQgbGFuZHMgYXQgdGhlIGxpc3QgdGFpbC4KPgo+IEJvdGggYmVo
YXZpb3VycyBhcmUgaW50ZW5kZWQgKHNvcnRlZCBpbnNlcnRpb24gcGx1cyBhCj4gZmFsbC10aHJv
dWdoIHBhdGggdGhhdCBzdGlsbCB3YW50cyB0aGUgbGFzdCBlbnRyeSdzIFBFTkRJTkcKPiBmbGFn
IGFkanVzdGVkKSwgYnV0IGJvdGggZGVyZWZlcmVuY2VzIG9mIHRoZSBwYXN0IHRoZSBlbmQKPiBu
b2RlIGFyZSB1bmRlZmluZWQgcGVyIEMxMS4KPgo+IEpha29iIEtvc2NoZWwgY2xlYW5lZCB1cCBt
YW55IHN1Y2ggc2l0ZXMgaW4gMjAyMiwgZm9yIGV4YW1wbGUKPiBjb21taXRzIDk5ZDhhZTRlYzhh
ICh0cmFjaW5nOiBSZW1vdmUgdXNhZ2Ugb2YgbGlzdCBpdGVyYXRvcgo+IHZhcmlhYmxlIGFmdGVy
IHRoZSBsb29wKSwgMjk2NmE5OTE4ZGYgKGNsb2NrZXZlbnRzOiBVc2UKPiBkZWRpY2F0ZWQgbGlz
dCBpdGVyYXRvciB2YXJpYWJsZSkgYW5kIGRjMWFjZDVjOTQ2IChkbG06Cj4gcmVwbGFjZSB1c2Fn
ZSBvZiBmb3VuZCB3aXRoIGRlZGljYXRlZCBsaXN0IGl0ZXJhdG9yCj4gdmFyaWFibGUpLiBUaGlz
IHNpdGUgd2FzIG5vdCBjb3ZlcmVkLgo+Cj4gQSBjYW5kaWRhdGUgZml4IHdvdWxkIHRyYWNrIGFu
IGV4cGxpY2l0IGluc2VydGlvbiB0YXJnZXQKPiAoc3RydWN0IGxpc3RfaGVhZCAqcG9zID0gJmV4
dF9pbnRjX2xpc3QpIHdoaWNoIGlzIG92ZXJ3cml0dGVuCj4gdG8gJm5vZGUtPmxpc3Qgb25seSB3
aGVuIHRoZSBsb29wIGJyZWFrcyBlYXJseS4gVGhlIFBFTkRJTkcKPiBmbGFnIGFkanVzdG1lbnQg
dGhlbiByZWFkcyBwb3MtPnByZXYgZGlyZWN0bHk6IGlmIHBvcy0+cHJldgo+IGlzICZleHRfaW50
Y19saXN0IChlbXB0eSBsaXN0LCBvciBicmVhayBvbiB0aGUgZmlyc3QgZW50cnkpLAo+IHRoZSBh
ZGp1c3RtZW50IGlzIHNraXBwZWQ7IG90aGVyd2lzZSBwb3MtPnByZXYgcG9pbnRzIHRvIHRoZQo+
IHJlYWwgZW50cnkgdGhhdCBiZWNvbWVzIHRoZSBwcmVkZWNlc3NvciBpbiBsaXN0IG9yZGVyLiBJ
biB0aGUKPiBmYWxsLXRocm91Z2ggcGF0aCBwb3Mgc3RheXMgYXQgdGhlIGxpc3QgaGVhZCwgYW5k
IGhlYWQtPnByZXYKPiBpcyB0aGUgbGFzdCByZWFsIGVudHJ5LCBzbyB0aGF0IGJyYW5jaCBrZWVw
cyBhZGp1c3RpbmcgdGhlCj4gbGFzdCBlbnRyeSBhcyBiZWZvcmUuIE9ic2VydmFibGUgYmVoYXZp
b3VyIGlzIHVuY2hhbmdlZC4KPgo+IElmIHRoaXMgaXMgaW50ZW50aW9uYWwgb3IgYWxyZWFkeSBr
bm93biwgcGxlYXNlIGRpc3JlZ2FyZC4KPiBPdGhlcndpc2UsIEkgYW0gaGFwcHkgdG8gc2VuZCBh
IFtQQVRDSF0gb3IgdG8gbGVhdmUgdGhlIGZpeAo+IHRvIHlvdS4gVGhhbmsgeW91IGZvciB5b3Vy
IHRpbWUsIGFuZCBzb3JyeSBmb3IgdGhlIG5vaXNlIGlmCj4gdGhpcyBpcyBub3QgYWN0dWFsbHkg
d29ydGggZml4aW5nIG9yIGhhcyBhbHJlYWR5IGJlZW4gc3BvdHRlZC4KPgpZZXMsIEkgdGhpbmsg
dGhpcyBzaG91bGQgYmUgZml4ZWQuIFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoZSBpc3N1ZS4KUGxl
YXNlIHNlbmQgdGhlIHBhdGNoLgoKVGhhbmtzLApTdW5pbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
