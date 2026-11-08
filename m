Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83A606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W7lp/OFG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+bU4NIF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=irfWvB1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BlFvSBJ8j85OS7opN+1uXM0uozGE9JLTUQE5A8Iam/Y=; b=W7lp/OFGKvNJl3a+l90NAvWS14
	vglpaivgwCEfs9hMlPVLFeUuVtqdJ4d4neU4uKbl90r1148Ys/93Urjy/iConrKbrpFrMkhsqJ+VE
	6P8VhJcDsRVCOvbXDTzBkSGEoLrFZ0Juk31m3mQLVS5fnJm3/UbGby7Dh11/HrJnIEdjd3k975lKJ
	lsKXQKOrXgGRg9O1QgAWCL39KQ1t96f96wVddfWNZX+3r0l4eWtodjohNdudJ52yHuwGX+R/Qlfhf
	DmjoS3uqTRng3pGmeBBmGCJ8RcOqQT3AYzP02yihzcj0h6cr+gMACFz+4fryN0giPg2CN7q+YlOqG
	ttrKfZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzm7-0000000FwBj-42lY;
	Sun, 08 Nov 2026 10:05:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzm5-0000000FwBL-1y0Y
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:05:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A87eQlw835890
	for <linux-riscv@lists.infradead.org>; Sun, 8 Nov 2026 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=; b=G+bU4NIFUyi4VeRw
	l1JKeJEaokuq16H6Dz3DilBsqmWTfBkYpiD1RvS1Iw7Kw1CbnvE8ZRkvVDeKGXRl
	1c1F949sXoczIFeHU8IdVWog3tsrZ3oi3JipxewtltWw5bJSaj7WlOBKAHME5E1x
	tlYv/WYQf5hQtsYhZ8aqr00Y+WB0c1QDTiOfOMwOkdj69F40CeQPxbaA5J7Amm9H
	3TkpTHvaxevQrZuSHbcB4oI9XDQCapR1K5hkMdeGyYzBV2Vj7cSFhj0dUlsmXVmb
	nb98ai8RK3qJ7pYZzdEtjcJfStRfPWU+pM4hAD82XDXJGr1morsi360ftdxDesXT
	hqNcsA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732mv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 10:05:19 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c416b236so3974987b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 02:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794132319; x=1794737119; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=;
        b=irfWvB1Jeh6BwAzP6HVTc+6rvVQxGOqnAOUgDUH6gT8TUSRzRX/RKd5Np6k3YlYlv7
         +x+z50pq9jmZcCClnvrWCLc446phmjbPgC9NIpeGZdqrvW/2v3Cy4urHpvkzZuL36Ja8
         JRQmdNWUu0FHTsZjXusWTf0TJzsS+CTwJDGB+N30RvRt0JXZ6ThtyJ/G1hX01nn9aDRQ
         YF90uHO6454nwNmj1GxhjzCZgwjNBZPf4CMClNhMIVCcs8FL9L90+f1PbbHHPJgwJ9EQ
         2QVPXBwNldU/CkCqcjELYY8t6YZDqlr5ZmxWQ/07f0a8+BTmCDhbafZ/1yIyWv3zT0va
         pJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794132319; x=1794737119;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lI2bMSw3JcTh5t2gsFtQ1Aa7uR3op4ozHoeuaAFPwP4=;
        b=gRVYT9aUDeaqb/X+zKCAIJUhAIqCaZ43EoQEisejlSA5LTZohECMvWC8WUlU4eL3Bx
         Cc2tCdjCx1KNHmcjtRUk2l9/XtuyxSBCQ3GwPrsskBeIv54zO9FC6Ov2EFqk5rXD71XK
         Qmc7ocnshlqVcWc010eWQp4fHB6/3ZxUKlqMzt8hWu536+1IzXdzuoDqKG8dK4tfDel8
         h9t1ityH/6J997/Djp/rQR9A2RWEezkeO5+v8UU30JqATkLWJY1xm5v1glw2qxopP0io
         0qqcMV3TLDevuB35E6TXep//3Brwx/QxzMoA08Liw4JJLeqyKLlTH+5BliS0TlaO+LsD
         U5jA==
X-Gm-Message-State: APuU4Z+GNm7sIycAi77MaPDahPTGENcBNu/RONx0FlR7O+OcJVVXSdGh
	Zs+8Nh2280ieAt0QrnvO57pJc/ioV3VuEY6M/+vnuTCXb9fcI0fwB8EoLCot+7M5LjUGuVs6SZQ
	xIba1lnIbdZMjrImAuwQRaNxo2DGru79BVuJZHRJ9UMGLbxriCgpDAdrGRTpNnu+P/WQx/PE=
X-Gm-Gg: AYBFou14QVtBGual0GaccznDyeEuHKVGMA9RuKdOWFcVOWFH/C9AAP45n1Sty6zGI0A
	zvOyFVa5TRLWzre33gXWHSyiwIexJ4xC6tgYGGD6RyAF/bO10ypeCVMQiVq0YMkj0d6YwjLq2M/
	bw6pJiHTkJZbcBI0kgZ8Rk6SYhRXaRrr7iiHoMajJ5vBOWtb+itDpiIAsPt2W4lgnGoamyBkHvB
	GEauSow2z682olMPfUdrfj/sdHTtI139RMl6m1s7n1DTpcgUmiKZSjqhhRTkpztAXC/XQ73vYa1
	8nS5rP4VyEkYp/mGTIFdBl94KNRrwLJGqn+AKrM6R06CX4TlQg1jJ564I+z+0bjRNW0k00739S7
	b7d9kwtvr7g18CSIpdp27zkjkbsgHIrSJZg1OYF52SDOv8994VuJz2LTz/XXAkzc4XhIIzb4qD7
	NWm/OSxEjz
X-Received: by 2002:a53:ba4e:0:b0:677:b670:bc2 with SMTP id 956f58d0204a3-67c3da757a5mr413285d50.131.1794132318585;
        Sun, 08 Nov 2026 02:05:18 -0800 (PST)
X-Received: by 2002:a53:ba4e:0:b0:677:b670:bc2 with SMTP id 956f58d0204a3-67c3da757a5mr413280d50.131.1794132318040;
        Sun, 08 Nov 2026 02:05:18 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc2c768sm11777827b3.30.2026.11.08.02.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:05:17 -0800 (PST)
Date: Sun, 8 Nov 2026 05:05:11 -0500
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only when
 available
Message-ID: <w7pia2wy5enxvv74erxbx7qcghh4acf5ljfzdoqo5jy6gxwm2n@p2eh5rtlta7q>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0MCBTYWx0ZWRfX1K3omiKF/Z1y
 4GjOytf4wnR1y7Pq0R+zi7N0XZ8Oik/LNAWGpIZqIBBpPpzNl+dDNAERSnhAYSluVS02tInirxn
 FSug9jCtv/39TZfRcl3vtb2xE0b9gBOVvyjC8UNbkynzj5Aeh28QM0LY3gYd8TcAhOidR5iGNIL
 jQ6V0sy5IdiNZ9tIwUAkzItjZzF/iZufvJROYAV3uQrXCELlrbwenxStjlBQHvUZyXu3Ogihpmt
 bClxhgYlhFdQUU4d+ASkx/Yigd2yPv011TOg0ViB8zbreT7f+cxucLrCXpIMzQs3Uqkbeh6o8Dn
 3c3/sGgIXKabeluB34JvHETTd0vlba9R0Tf22XnA8LDkpSYdXXqjG+xDOYadOMyHP54oVYdxbnA
 4bpAaIT+iXA9nM72R3JuI0qPJonVDln8jIhqISFfCW88wwB883I/UlRnSt53R9kMhh9xrQp3+Ik
 Z3scs4e2jOZo1i3fJ2Q==
X-Proofpoint-ORIG-GUID: t2kpDLQOciH-DSaiciHkgLwfgrJtoVjs
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af0495f cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yKTjZOk7vXKTgSIRYZQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0MCBTYWx0ZWRfXxtg6wLP/KMnv
 oDSL3Q7jNcBYYOM8BdYE2fV6tSXZGE1hHxyKGQdEgQAp9hTUUpzv9iIRa4xmga17cXOFLye2HQS
 xvYkZBGHjWzZm2cxXHQEZGgava44iVU=
X-Proofpoint-GUID: t2kpDLQOciH-DSaiciHkgLwfgrJtoVjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_020521_542037_AAA1DB04 
X-CRM114-Status: GOOD (  12.89  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgUmFkaW0sCgpPbiAyMDI2LTEwLTA2IDA5OjUzLCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj5V
c2VyLW1vZGUgdXNlIG9mIFppY2ZpbHAgYW5kIFppY2Zpc3MgcmVxdWlyZXMgc2VudmNmZy5MUEUg
YW5kCj5zZW52Y2ZnLlNTRSwgcmVzcGVjdGl2ZWx5LCB3aGljaCB3ZSBzZXQgb25seSB3aGVuIGlz
X3VzZXJfbHBhZF9lbmFibGVkKCkKPmFuZCBpc191c2VyX3Noc3RrX2VuYWJsZWQoKSAoQ09ORklH
X1JJU0NWX1VTRVJfQ0ZJLCB0aGUgZXh0ZW5zaW9uIG9uIGFsbAo+aGFydHMsIGFuZCBub3QgZGlz
YWJsZWQgYnkgcmlzY3Zfbm91c2VyY2ZpKS4gIGh3cHJvYmUgcmVwb3J0cyB0aGUKPmV4dGVuc2lv
bnMgZnJvbSB0aGUgcGVyLWhhcnQgSVNBIGJpdG1hcHMgYWxvbmUsIHNvIGl0IGNhbiBhZHZlcnRp
c2UKPmV4dGVuc2lvbnMgdGhhdCBhcmUgYWx3YXlzIGRpc2FibGVkIGluIHVzZXItbW9kZS4KPgo+
UmVwb3J0IGNvcnJlY3QgZW52aXJvbm1lbnQgdG8gdXNlci1tb2RlLgo+Cj5UaGUgY2hhbmdlcyB0
byBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJjZmkuaCBhdm9pZAo+SVNfRU5BQkxFRChDT05G
SUdfUklTQ1ZfVVNFUl9DRkkpIGd1YXJkcyBpbiB0aGUgY29uZGl0aW9ucy4KPgo+Rml4ZXM6IDMw
YzMwOTkwMzZhOSAoInJpc2N2L2h3cHJvYmU6IGFkZCB6aWNmaWxwIC8gemljZmlzcyBlbnVtZXJh
dGlvbiBpbiBod3Byb2JlIikKPlNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+CgpSZXZpZXdlZC1ieTogR3VvZG9uZyBYdSA8Z3VvZG9u
Zy54dUBvc3MucXVhbGNvbW0uY29tPgoKRm9yIHRoZSByZWNvcmQsIHdoaWxlIGxvb2tpbmcgYXQg
dGhlIHJpc2N2X25vdXNlcmNmaSBwYXJ0IG9mIHRoaXMgSQpmb3VuZCB0aGF0IHRoZSBvcHRpb24g
aXMgcGFyc2VkIHRvbyBsYXRlIGZvciB0aGUgSVNBIHZhbGlkYXRvcnMuIEkgc2VudAphIGZpeCBz
ZXBhcmF0ZWx5IFsxXS4gUnVuLXRpbWUgY2hlY2tpbmcgYXMgZG9uZSBoZXJlIGlzIHN0aWxsIGNv
cnJlY3QgYW5kCnRoYXQgZml4IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nIGluIHRoaXMgcGF0Y2gu
CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI2MTEwOC1ub3VzZXJjZmktZWFy
bHktcGFyYW0tdjEtMS1lYTIyZDNhNjA2ODNAb3NzLnF1YWxjb21tLmNvbS8KCkJSLApHdW9kb25n
IFh1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
