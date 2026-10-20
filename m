Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F196A606A319
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YK9I9+J4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NB71qG01;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fK8nJFT3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TaGd+Jyr1Lx7rX7vODz0QRor0BcGdv91H9b0ZkQDZoo=; b=YK9I9+J4Sfkx9Z
	XQ/X5IqW6x5Bu0GNVCEu4a5RTJRqRgkzzkCRxWic3Ca3RGDJH/0reMqUK8wscV2GWlX3GoLJMULpL
	ooxT3U9du737cNj7t93j33YM285U36xZTks9Zhgvp21aDBsWP1ZCEOVMiQvygZiTy+Gw85Ki+LFSs
	CGRD2dOy1xMSFU3E+8ZQySH3A7/ln78IWgRH4Dd8MglNzXwBaFJGjYN1ZM6yDQJit0yt6vGSOT0AB
	XK5l79dBQT0QtGaIXnpct32xyuT29ZxqqaubUA356nBz4Sc7tUD/fd5qNPB/hDYTDQW2JrUqQ2ZXP
	OciBTrY8UZmF8L+Mb/8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7ES-00000009S3U-2obz;
	Tue, 20 Oct 2026 10:38:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7EQ-00000009S2h-0CFk
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 10:38:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8B6524178122
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 10:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kp5gpUWP9+ledzHkf+zwpt5NSmecoWohw/hKxyjrTRI=; b=NB71qG01HUvJzbP+
	+XG8IvxeOGaxV9LMBIScz66/q3Lps+zBFTwdNvzjmLu+bezSSXb3BQALU/h7iwer
	oZGrqb91SyC1Ap6Yzdxa0nP1MlkNClV5auh65AS4ZrRqTGpl/nKcdyJSel9n3eBD
	JCUhugLVw2CIGCkRBLdqSFmJ2SZLHXUBqQJXenfC6ekFcTr3hsx7aSbsfP8LpWxI
	AA5t1THSu0aHLVUcsu+j+/cmyTwDtV3Kd+3huC9eRNxsduGqX411DaHiWdzdn3LM
	u9MHSA9yaKqqpvan7NdftVDZk0iva2OoOXbfpNazOfBFV3YdoeYcyzhAcCTS0a6j
	50lUyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2399-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 10:38:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so362209a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Oct 2026 03:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492688; cv=none;
        d=google.com; s=arc-20260327;
        b=lxfzyYTV1urYtopF1smBZmn8Re4Za3UdeUW51jicuPcg0uIx/+tHnE0UF4v0kTqslr
         hUltfepYWwqVnXNZN16WUVkeRyPzyHfwuu2i9Oy/+Uf61ds+WmYuiyNRwaKFPQvWP3uy
         swWqULOnNK2fwRkPoKaWO9qHWGHB6SRrY0udzg6G6PS0O3AkW2pGO9klHPY9E27nW7DM
         NT3SCYKi0x1M5ybDyGzsavyKpIJ3AbJD9n3wTlScFjuWm2jrx4m/I5j1izdSAkFZoLhK
         RLqvNa/mXanXfokONjMHkZE2eKw2KqtFg+/4nqT8CFzkAwTXCAh7JnzvQEJ//VSt378G
         soDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kp5gpUWP9+ledzHkf+zwpt5NSmecoWohw/hKxyjrTRI=;
        fh=eHRQH+tir7t6NUX2i0UfurXER3NuzTkjASFzaSR4AgY=;
        b=bUidbqAYI1TOYVhn0Yw7H3e4UowHmB8lxQcwIIPG11373M6egbQtViKtADOqDD0gxL
         9GcC/2c5eCvV0hUALskMLz2xK8dDhAx04EH3lk0zyRK7sy8hoaj6z8d4Mkk21Bcy1NZK
         Im1fDgQoPRMdNbSEzy38mmRbIJo2qloDwEKFnOu+QomURwFDHcV+SNB4PCyiYYdK72LD
         tAVu6hKHGp5oqJCP5sKV0OpYiJnPgNOD1u+zfWfMynrhefLj0RMGtGMzbMpum55MxHbo
         yA1KkC/TZ7b0cFgKC83Jp8g8w+hDz79W72dvx7XrKXDYnz16M9ZpbD6EXioxpuOyNVKC
         JMVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792492688; x=1793097488; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kp5gpUWP9+ledzHkf+zwpt5NSmecoWohw/hKxyjrTRI=;
        b=fK8nJFT3s3hy8/1aLplATHvLQu6L6cEa/sYo7xJlWh/DeOcFnD5UGBPn05WCB+JQTU
         I4sFHoemnNZJ5RYTdxGe5W2jzC6sRB0zMQFLLVsPBTyXOiZbs9WCXvF2LFqXUpT46+eJ
         oOZHjbdIlFBKZH4QPQY1Jjb3+siNIFEPf25gRxaSsfiUjf3TdDruUeoYGQt4rZdFWznt
         u1vfUDpOJATDVjYqEm1hR9XX6KdDC7MEx3b5foKKKSI0YWk1wP5Y+TXTzA9NOBq6RB0w
         /g4+eX/wVuOGYtm22+slmygmErKYY5ZR+zdDtxyi1CVB3ff9/Teo7mwfmFjuhYh1VgeD
         q2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492688; x=1793097488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp5gpUWP9+ledzHkf+zwpt5NSmecoWohw/hKxyjrTRI=;
        b=e0r/853qGreYN/cURjnwMeC6sZMjaQe4KRpdYxBdAlEJ9zI3j3TeF7wFHZf7b32uUR
         XDyXDEuMJyJ5fr91/DuZngvDuiR9CBjiOuarSceSgclXIsUj6jZU79fUrYXBTurkYpgV
         m6B0rWhJCNsJmEqlS0FY2NZeDHZ7lZa+XWMQE3uqmbKHoEjPGK3quoY+h8IelqBX5CPm
         R47YdC6dANJMlZi2I1YfM4umnuT/r74qvU/IQ9+I1saKAJ3UyGh3HIvahXtJhXZz2ZMF
         40aZhdf8iPDm9SQqNA/j6jliHI1TVmpCzE15P6Mt1VuveXB7Bl0xu6pSAq+z1a+849cc
         zrXg==
X-Forwarded-Encrypted: i=1; AKwUvBy4RltLTZ32Dv0Cmxo1ch10s+5IELJSH+tjYtAwa9sEGZIQN+ZyTI5oolUXpvVdR3Yy3njg8zcuc5OmHQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJMv2ihytVuCjrfO+qhMMH9KHstKK9rJeVWDjv4hrIFTYtWGRco
	0Gf+9FujSYfZLyqdYAnMno7r2o0iU8ilTUdDMW8V28YjG08eA+AqVHMNoMdN2BoMzsMvnOvFeA8
	ZKu60G0hxqReBXk9VmtDxwHopy+COWa2mIQ2IdAmMSPTQkF50Ga5N5sNelXaLHheM30xpgGWYru
	GJbVeqOm5J+U/hC68dzLK4sjnbnsKgd4bBsBpFoJurUX06QA==
X-Gm-Gg: AYBFou1GyrtuEgnQ5cspPKTrLCnVtYTDxqj51Bizdfzj7OCkmUhk6wE8sJHC+1/99Jx
	8GbnBCYGDeYTGGRU+YM4B8rcMVBcEG5AFKYODzlftkS3XClZ4awJmZHVNQPB3L0R1ardbBBn2Pm
	PuYJFKK/W5T2xb0bPMJO4fluHKpmQbtU7xfo0Sd66AJlObNWkoPJzpj7JjFg==
X-Received: by 2002:a17:90b:4c05:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3aceec79968mr9329456a91.12.1792492687875;
        Tue, 20 Oct 2026 03:38:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:3ab:3384:1a44 with SMTP id
 98e67ed59e1d1-3aceec79968mr9329429a91.12.1792492687278; Tue, 20 Oct 2026
 03:38:07 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAJh9TS+k9P7bpa5gW+XV_da6JvA6TOGFJEdmsEmAULNAiZTBaQ@mail.gmail.com>
 <CAJh9TSJWr8eLG=9_UjwdOqwUqfsCxaAJb8NUUJ9NKjnmPcLSPA@mail.gmail.com>
 <CAPx+jO9x304geo422e6PGNGPNsgSPAKcqUUyX244jOwy7fNw3w@mail.gmail.com> <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com>
In-Reply-To: <CAJh9TSK0CJPWGFQYFcWmA4TqcZuDTdrmOduBzZHVgSQVomCZeg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:37:55 +0200
X-Gm-Features: AclHuK_46PCLXSTVIxbGuv8F4DK4GjNXI3Zf043qnmZPcdcesdWj-Ev8QNsw8-4
Message-ID: <CAPx+jO89BqvJuoYUddKvbgsuOeJEft5cFp8HnS=04-Y6uASi3g@mail.gmail.com>
Subject: Re: RISC-V genpd race in OSI mode (genpd domain power_off vs firmware
 suspend call)
To: Jimmy Ho <jimmy.ho@sifive.com>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org,
        Anup Patel <anup@brainfault.org>, rafael@kernel.org,
        daniel.lezcano@linaro.org, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Nick Hu <nick.hu@sifive.com>, ulfh@kernel.org
X-Proofpoint-GUID: Nurd7Kt14IFr1VBG8B4sEfoGxHKt3ppH
X-Proofpoint-ORIG-GUID: Nurd7Kt14IFr1VBG8B4sEfoGxHKt3ppH
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad74490 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=UXIAUNObAAAA:8 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8
 a=abO3mwVV_VmizPnVPssA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a1s67YnXd6TbAZZNj1wK:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfX9tKX9q6O3XOs
 NYML26VSyyF8uzctX1KJdXqbzjWZczdQtEnnwMNJzvpJfs533MQXwRzJ2jR3NNnmpDa2m4Zoalc
 zt2kiwlm+hrAmLf6nXmntwYaZTUP/0MbhKsNDUwFGNGpgQr54PZB3uNMvnogNEWr0dBJaHCpUy8
 t671rPMr+6IVlM/ZYnDLKelwjfsc+j6VDY061TMHO3jiHqTtqvYrdVtZ9F+LHlf/SgSPpMOTp18
 7lMDY+0vtC9bOEifv+HrbtGhSTmo/kEI0Y3Uolevw6M7UBQ66FRNZDA7rHkMw6gUYOC2bDPlEBV
 CF41hi2uPTAWtMZ+4SUMCkbr713Z9rS6sTTVeVlXzXNIrHMld7PG82tKTUpYYLsSjqEfUwS7Emb
 y37cgPliFgqw5kHRmXiTh2BVmc4JqUYmVH6dBdRHZXHJ9Y6+mjSzDaocUSa7JBdKiTpGutPJvYe
 MsS/DtMm8WkBdD0ZFBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MiBTYWx0ZWRfXwQsYanF9wSpr
 FHphjacX0WJiH92Q6vGf3dP0Z1KTrQPPLQt/C8rvBFXS0vR4c3YlPbQe5Rs5VjEK2LIrwEWVh13
 uvHxeYtOnrqb9mqw1BAq9OEZeohfi14=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_033810_210860_F0963C1D 
X-CRM114-Status: GOOD (  42.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgMzo1M+KAr0FNIEppbW15IEhvIDxqaW1teS5ob0BzaWZp
dmUuY29tPiB3cm90ZToKPgo+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0bHksIHlvdSBhcmUgcmVm
ZXJyaW5nIHRvIGEgbWVjaGFuaXNtIHNpbWlsYXIgdG8KPiBwc2NpX3ZhbGlkYXRlX3N0YXRlX2Nv
b3JkaW5hdGlvbiBpbiBQU0NJLgo+IEhvd2V2ZXIsIHRoZXJlIGlzIGEgdGltZSB3aW5kb3cgYmV0
d2VlbiB0aGUgZ2VucGQgY2FsbGluZyB0aGUKPiBwb3dlcl9vZmYgY2FsbGJhY2sgYW5kIHRoZSBh
Y3R1YWwgZXhlY3V0aW9uIG9mCj4gcHNjaV92YWxpZGF0ZV9zdGF0ZV9jb29yZGluYXRpb24uCj4g
RHVyaW5nIHRoaXMgd2luZG93LCBhbm90aGVyIGNvcmUgY291bGQgd2FrZSB1cCwgZW50ZXIgTGlu
dXgsIHR1cm4gdGhlCj4gY2x1c3RlciBnZW5wZCBiYWNrIG9uLAo+IGFuZCBjb21wbGV0ZSBpdHMg
b3duIHN1c3BlbmQgc2VxdWVuY2UgYmVmb3JlIHRoZSBpbml0aWFsIGNvcmUgZmluaXNoZXMKPiBz
dXNwZW5kaW5nLgo+IENvbnNlcXVlbnRseSwgdGhlIGluaXRpYWwgY29yZSByZW1haW5zIHVuYXdh
cmUgdGhhdCBhbm90aGVyIGNvcmUgaGFkCj4gd29rZW4gdXAgZHVyaW5nIHRoYXQgaW50ZXJ2YWwu
CgpSaWdodC4gU3RpbGwsIHRoZSBGVyBrbm93cyBhYm91dCB0aGlzIGFuZCBzaG91bGQgcHJldmVu
dCB0aGUgaW5pdGlhbApjb3JlIGZyb20gYmVpbmcgc3VzcGVuZGVkLiBJbnN0ZWFkIHRoZSBGVyBz
aG91bGQgcmV0dXJuIGFuIGVycm9yIGNvZGUKZm9yIHRoZXNlIHNpdHVhdGlvbnMuCgpLaW5kIHJl
Z2FyZHMKVWZmZQoKPgo+IEJlc3QgcmVnYXJkcwo+IEppbW15IEhvCj4KPiBPbiBGcmksIEF1ZyAy
OCwgMjAyNiBhdCA4OjU14oCvUE0gVWxmIEhhbnNzb24KPiA8dWxmLmhhbnNzb25Ab3NzLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBBdWcgMjgsIDIwMjYgYXQgNzowM+KAr0FN
IEppbW15IEhvIDxqaW1teS5ob0BzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gUmVzZW5k
aW5nIHRoaXMgZm9sbG93LXVwIHRvIFVsZuKAmXMgY3VycmVudCBhZGRyZXNzCj4gPiA+Cj4gPiA+
IE9uIEZyaSwgQXVnIDI4LCAyMDI2IGF0IDEyOjU24oCvUE0gSmltbXkgSG8gPGppbW15LmhvQHNp
Zml2ZS5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGkgbGludXgtcG0sCj4gPiA+ID4KPiA+
ID4gPiBXZSBoaXQgYSByYWNlIGNvbmRpdGlvbiBpbnZvbHZpbmcgZ2VucGQncyBDUFUgUE0gZG9t
YWluIChPU0ktbW9kZQo+ID4gPiA+IGhpZXJhcmNoaWNhbCBjcHVpZGxlLCBzaW1pbGFyIHRvIHRo
ZSBBUk0gUFNDSSBPU0kgbW9kZWwpIG9uIGEgUklTQy1WCj4gPiA+ID4gcGxhdGZvcm0sIGFuZCB3
b3VsZCBsaWtlIHRvIGdldCB5b3VyIG9waW5pb24gb24gd2hldGhlciB0aGlzIGlzIGEKPiA+ID4g
PiBnZW5wZC1sZXZlbCBpc3N1ZSBhbmQgd2hhdCB0aGUgcHJlZmVycmVkIGdlbmVyaWMgZml4IHdv
dWxkIGxvb2sgbGlrZS4KPiA+ID4gPgo+ID4gPiA+IEJhY2tncm91bmQKPiA+ID4gPiAtLS0tLS0t
LS0tCj4gPiA+ID4gT2JzZXJ2ZWQgdGhpcyBpc3N1ZSBvbiBxZW11IHBsYXRmb3JtCj4gPiA+ID4g
T24gb3VyIFNvQywgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1hcGxpYy1tYWluLmMgcmVnaXN0
ZXJzIGEgZ2VucGQKPiA+ID4gPiBub3RpZmllciB0byBzYXZlL3Jlc3RvcmUgdGhlIFMtbW9kZSBB
UExJQyBjb250ZXh0Ogo+ID4gPiA+Cj4gPiA+ID4gICBhcGxpY19ub3RpZmllcigpCj4gPiA+ID4g
ICAgIEdFTlBEX05PVElGWV9QUkVfT0ZGIC0+IGFwbGljX3NhdmUoKQo+ID4gPiA+ICAgICBHRU5Q
RF9OT1RJRllfT04gICAgICAtPiBhcGxpY19yZXN0b3JlKCkKPiA+ID4gPgo+ID4gPiA+IENQVXMg
YXJlIGF0dGFjaGVkIHRvIHRoaXMgZ2VucGQgdmlhIGR0X2lkbGVfYXR0YWNoX2NwdSgpIChhcyBp
bgo+ID4gPiA+IGRyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jLCBtaXJyb3Jpbmcg
Y3B1aWRsZS1wc2NpLmMpLiBXaGVuCj4gPiA+ID4gdGhlIGxhc3QgQ1BVIGluIHRoZSBkb21haW4g
Z29lcyBpZGxlLCBnZW5wZF9wb3dlcl9vZmYoKSBkZWNpZGVzIHRoZQo+ID4gPiA+IGRvbWFpbiBj
YW4gYmUgdHVybmVkIG9mZiAoYmFzZWQgb24gdGhlICJub3Rfc3VzcGVuZGVkIiBjb3VudCBjb21w
dXRlZAo+ID4gPiA+IHVuZGVyIGdlbnBkX2xvY2spLiBXaGVuIHRoZSBmaXJzdCBDUFUKPiA+ID4g
PiByZXN1bWVzLCBnZW5wZF9wb3dlcl9vbigpIGRlY2lkZXMgdG8gdHVybiB0aGUgZG9tYWluIGJh
Y2sgb24gYW5kIGZpcmVzCj4gPiA+ID4gR0VOUERfTk9USUZZX09OLCB3aGljaCB0cmlnZ2VycyBh
cGxpY19yZXN0b3JlKCkuCj4gPiA+ID4KPiA+ID4gPiBIb3dldmVyLCB0aGUgYWN0dWFsIFNCSSBI
U00gc3VzcGVuZCBjYWxsIChyaXNjdl9zYmlfaGFydF9zdXNwZW5kKCksCj4gPiA+ID4gc2ltaWxh
ciB0byBhIFBTQ0kgQ1BVX1NVU1BFTkQgY2FsbCkgaXMgKm5vdCogaXNzdWVkIGluc2lkZQo+ID4g
PiA+IGdlbnBkX2xvY2suIGdlbnBkJ3MgcG93ZXJfb2ZmKCkgY2FsbGJhY2sgb25seSByZWNvcmRz
IHdoaWNoIGRvbWFpbgo+ID4gPiA+IGlkbGUgc3RhdGUgd2FzIHNlbGVjdGVkOyB0aGUgcmVhbCBm
aXJtd2FyZSBzdXNwZW5kIGNhbGwgaGFwcGVucyBsYXRlciwKPiA+ID4gPiBhc3luY2hyb25vdXNs
eSwgb24gZWFjaCBDUFUncyBvd24gY3B1aWRsZSBlbnRlciBwYXRoCj4gPiA+ID4gKF9fc2JpX2Vu
dGVyX2RvbWFpbl9pZGxlX3N0YXRlKCkpLgo+ID4gPiA+Cj4gPiA+ID4gVGhlIHJhY2UKPiA+ID4g
PiAtLS0tLS0tLQo+ID4gPiA+IEJlY2F1c2Ugb2YgdGhpcyBnYXAgYmV0d2VlbiAiZ2VucGQncyBz
b2Z0d2FyZSBkZWNpc2lvbiB0aGF0IHRoaXMgQ1BVCj4gPiA+ID4gaXMgbGFzdC1tYW4gLyBmaXJz
dC1tYW4iIGFuZCAidGhlIENQVSBhY3R1YWxseSBpc3N1aW5nIHRoZSBmaXJtd2FyZQo+ID4gPiA+
IHN1c3BlbmQvcmVzdW1lIGNhbGwiLCB3ZSBvYnNlcnZlZCB0aGUgZm9sbG93aW5nIHNlcXVlbmNl
Cj4gPiA+ID4KPiA+ID4gPiAxLiBDUFUwIHJlcXVlc3RzIGEgc3lzdGVtIGRvbWFpbi1sZXZlbCBw
b3dlci1nYXRlIChkZWVwIHNsZWVwLCB0ZWFycyBkb3duIHRoZQo+ID4gPiA+ICAgIHNoYXJlZCBT
LW1vZGUgQVBMSUMgY29udGV4dCkgYW5kIGhhbmRzIG9mZiB0byBmaXJtd2FyZS4KPiA+ID4gPiAy
LiBCZWZvcmUgQ1BVMCdzIHJlcXVlc3QgaXMgcGh5c2ljYWxseSBjb21wbGV0ZWQsIENQVTEgd2Fr
ZXMgdXAsCj4gPiA+ID4gICAgZ2VucGRfcG93ZXJfb24oKSBydW5zLCBHRU5QRF9OT1RJRllfT04g
ZmlyZXMsIGFwbGljX3Jlc3RvcmUoKSBydW5zLgo+ID4gPiA+IDMuIENQVTEgZ29lcyBpZGxlIGFn
YWluLCBidXQgdGhpcyB0aW1lIHN5c3RlbSBkb21haW4tbGV2ZWwgZ2VucGQgcmVqZWN0Cj4gPiA+
ID4gICAgcmVxdWVzdCwgc28gaXQgZmFsbGJhY2sgdG8gY29yZSBsZXZlbCBwb3dlci1nYXRlCj4g
PiA+ID4gNC4gQ1BVMCdzIG9yaWdpbmFsIHN5c3RlbSBkZWVwIHBvd2VyLWdhdGUgcmVxdWVzdCBl
dmVudHVhbGx5IGNvbXBsZXRlcyBhdCB0aGUKPiA+ID4gPiAgICBmaXJtd2FyZSBsZXZlbCAtLSBw
aHlzaWNhbGx5IGNvbGxhcHNpbmcgdGhlIHN5c3RlbSBkb21haW4sIGluY2x1ZGluZyB0aGUKPiA+
ID4gPiAgICBTLW1vZGUgQVBMSUMgY29udGV4dCwgc2F2ZWQgZWFybGllciBieSBhcGxpY19zYXZl
KCkKPiA+ID4gPiA1LiBDUFUwIHdha2VzIHVwIChlLmcuIFVBUlQgaW50ZXJydXB0KSwgZW50ZXJz
IExpbnV4LCBidXQgc3lzdGVtIGdlbnBkJ3MKPiA+ID4gPiAgICBzb2Z0d2FyZSBzdGF0ZSBzdGls
bCBzYXlzIHRoZSBkb21haW4gaXMgIm9uIiAoZnJvbSBzdGVwIDIpLCBzbyBzeXN0ZW0gZG9tYWlu
Cj4gPiA+ID4gICAgR0VOUERfTk9USUZZX09OIHdpbGwgbm90IGJlIGZpcmVkIGFnYWluIGFuZCBh
cGxpY19yZXN0b3JlKCkgd2lsbCBub3QgYmUKPiA+ID4gPiAgICBjYWxsZWQKPiA+ID4gPgo+ID4g
PiA+IFRoaXMgbG9va3Mgc3RydWN0dXJhbGx5IGlkZW50aWNhbCB0byB0aGUgcmFjZSBURi1BJ3Mg
UFNDSSBPUy1pbml0aWF0ZWQKPiA+ID4gPiBtb2RlIGRvY3VtZW50YXRpb24gZGVzY3JpYmVzOgo+
ID4gPiA+IGh0dHBzOi8vdHJ1c3RlZGZpcm13YXJlLWEucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0
L2Rlc2lnbl9kb2N1bWVudHMvcHNjaV9vc2lfbW9kZS5odG1sI3JhY2VzLWluLW9zLWluaXRpYXRl
ZC1tb2RlCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+ICAgIkluIE9TLWluaXRpYXRlZCBtb2RlLCB0
aGVyZSBhcmUgcmFjZSB3aW5kb3dzIHdoZXJlIHRoZSBPUydzIHZpZXcKPiA+ID4gPiAgIGFuZCBp
bXBsZW1lbnRhdGlvbidzIHZpZXcgb2YgdGhlIHN5c3RlbSdzIHN0YXRlIGRpZmZlci4uLiB0aGUg
T1MKPiA+ID4gPiAgIG1pZ2h0IHJlcXVlc3QgYSBwb3dlcmRvd24gc3RhdGUgZm9yIGEgbm9kZSBm
cm9tIG9uZSBjb3JlLCB3aGlsZSBhdAo+ID4gPiA+ICAgdGhlIHNhbWUgdGltZSwgdGhlIGltcGxl
bWVudGF0aW9uIG9ic2VydmVzIHRoYXQgYW5vdGhlciBjb3JlIGluCj4gPiA+ID4gICB0aGF0IG5v
ZGUgaXMgcG93ZXJpbmcgdXAuIgo+ID4gPiA+Cj4gPiA+ID4gVEYtQSdzIGFuc3dlciBpcyB0byBy
ZXF1aXJlIHRoZSBPUyB0byBlbmNvZGUgYSAibGFzdF9hdF9wd3JsdmwiIGZpZWxkCj4gPiA+ID4g
aW50byB0aGUgU3RhdGVJRCBwYXNzZWQgdG8gQ1BVX1NVU1BFTkQsIHdoaWNoIGZpcm13YXJlIHZh
bGlkYXRlcwo+ID4gPiA+IGFnYWluc3QgaXRzIG93biB2aWV3IG9mIHN5c3RlbSBzdGF0ZSBiZWZv
cmUgaG9ub3JpbmcgYSBwb3dlcmRvd24KPiA+ID4gPiByZXF1ZXN0LiBXZSBjb3VsZCBub3QgZmlu
ZCBhbnkgY29kZSBpbiBjdXJyZW50IG1haW5saW5lIExpbnV4Cj4gPiA+ID4gKGNwdWlkbGUtcHNj
aS5jIG9yIGdlbmVyaWMgY3B1aWRsZS9nZW5wZCBjb2RlKSB0aGF0IGFjdHVhbGx5IGNvbXB1dGVz
Cj4gPiA+ID4gYW5kIGVuY29kZXMgdGhpcyBmaWVsZCBkeW5hbWljYWxseSBwZXIgc3VzcGVuZCBj
YWxsLCBzbyBhcyBmYXIgYXMgd2UKPiA+ID4gPiBjYW4gdGVsbCB0aGlzIHJhY2UgaXMgdW5oYW5k
bGVkIGdlbmVyaWNhbGx5IHRvZGF5LCBvbiBib3RoIGFybS9wc2NpCj4gPiA+ID4gYW5kIHJpc2N2
L3NiaSBiYWNrZW5kcy4KPiA+ID4gPgo+ID4gPiA+IE9wdGlvbnMgd2UgY29uc2lkZXJlZAo+ID4g
PiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiAxLiBJbXBsZW1lbnQgc29tZXRoaW5n
IGxpa2UgUFNDSSdzIGxhc3RfYXRfcHdybHZsIGdlbmVyaWNhbGx5OiBleHBvc2UKPiA+ID4gPiAg
ICBnZW5wZCdzIGFscmVhZHktY29tcHV0ZWQgImFtIEkgdGhlIGxhc3QgQ1BVIGluIHRoaXMgZG9t
YWluIgo+ID4gPiA+ICAgIGluZm9ybWF0aW9uIHRocm91Z2ggdGhlIHBvd2VyX29mZigpIGNhbGxi
YWNrIEFQSSwgc28KPiA+ID4gPiAgICBiYWNrZW5kcyBjYW4gcGFzcyBpdCBkb3duIHRvIGZpcm13
YXJlLCBhbmQgaGF2ZSBmaXJtd2FyZSB2YWxpZGF0ZS8KPiA+ID4gPiAgICByZWplY3Qgc3RhbGUg
cmVxdWVzdHMuCj4gPiA+ID4gICAgLSBQcm86IG1hdGNoZXMgdGhlIGRvY3VtZW50ZWQgUFNDSSBP
U0kgYXBwcm9hY2guCj4gPiA+ID4gICAgLSBDb246IFdlIGRvbid0IGtub3cgaG93IHRvIHNldCB0
aGlzIGZsYWcgcHJvcGVybHkgaW4gYSBnZW5lcmljIHdheS4KPiA+ID4gPiAgICAgIGxhc3RfYXRf
cHdybHZsIGlzIG9ubHkgbWVhbmluZ2Z1bCBvbiByaXNjdi9hcm0sIHNvIHdlIGNhbid0IGp1c3QK
PiA+ID4gPiAgICAgIGFkZCBpdCB0byBnZW5wZCdzIGdlbmVyaWMgY29kZSBwYXRoLiBnZW5wZCBh
bHNvIGRvZXNuJ3Qga2VlcCBhCj4gPiA+ID4gICAgICBjb3VudGVyIG9mIGhvdyBtYW55IENQVXMg
aW4gYSBkb21haW4gYXJlIHN0aWxsIGFsaXZlLCBzbyB0aGVyZSdzCj4gPiA+ID4gICAgICBubyBl
eGlzdGluZyBzdGF0ZSBpbiBnZW5wZCdzIHBvd2VyX29mZigpIGNhbGxiYWNrIHdlIGNvdWxkIHJl
YWQKPiA+ID4gPiAgICAgIHRvIGRlcml2ZSB0aGUgZmxhZy4gT25lIGlkZWEgd291bGQgYmUgdG8g
d2FsayB0aGUgZ2VucGQgaGllcmFyY2h5Cj4gPiA+ID4gICAgICBmcm9tIHdpdGhpbiB0aGUgcG93
ZXJfb2ZmKCkgY2FsbGJhY2sgYW5kIGNoZWNrIHRoZSBydW50aW1lX3N0YXR1cwo+ID4gPiA+ICAg
ICAgb2YgZWFjaCBDUFUgZGV2aWNlIGluIHRoZSBzYW1lIGRvbWFpbiAoZ2VucGQgZG9tYWlucyBh
bHJlYWR5IGNhcnJ5Cj4gPiA+ID4gICAgICBhIENQVSBtYXNrLCBhbmQgZ2V0X2NwdV9kZXZpY2Uo
KSBjYW4gYmUgdXNlZCB0byBsb29rIHVwIHRoZQo+ID4gPiA+ICAgICAgY29ycmVzcG9uZGluZyBD
UFUgZGV2aWNlKQo+ID4gPiA+Cj4gPiA+ID4gMi4gRG8gdGhlIHBvd2VyLWRvbWFpbiBjb250cm9s
IGRpcmVjdGx5IGZyb20gdGhlIHBvd2VyX29mZigpL3Bvd2VyX29uKCkKPiA+ID4gPiAgICBnZW5w
ZCBjYWxsYmFja3MgKGUuZy4gaGF2ZSB0aGVtIHBva2UgdGhlIFNvQydzIHBvd2VyIGNvbnRyb2xs
ZXIKPiA+ID4gPiAgICByZWdpc3RlcnMgdmlhIGFuIFNCSSBjYWxsLCBpbnN0ZWFkIG9mIHJlbHlp
bmcgb24gZWFjaCBDUFUncyBvd24KPiA+ID4gPiAgICBpZGxlLWVudHJ5IHBhdGggdG8gdHJpZ2dl
ciB0aGUgZGVlcGVzdCBzdGF0ZSkuCj4gPiA+ID4gICAgaXQgY3JlYXRlcyB0d28gaW5kZXBlbmRl
bnQgZHJpdmVyIHRoYXQgd2lsbCB0b3VjaCBwb3dlciBjb250cm9sbGVyCj4gPiA+ID4gICAgKG9w
ZW5zYmkgdnMgbGludXgpCj4gPiA+ID4KPiA+ID4gPiAzLiBIYXZlIGVhY2ggQ1BVIHBhc3MgYSBt
b25vdG9uaWNhbGx5IGluY3JlYXNpbmcgc2VxdWVuY2UgbnVtYmVyCj4gPiA+ID4gICAgYWxvbmdz
aWRlIGl0cyBzdXNwZW5kIHJlcXVlc3QgdG8gZmlybXdhcmUsIGFuZCBoYXZlIGZpcm13YXJlCj4g
PiA+ID4gICAgaXRzZWxmIGRldGVjdCBhbmQgcmVqZWN0L2Rvd25ncmFkZSBhIGRlZXAgcG93ZXIt
ZG93biByZXF1ZXN0IGlmIGEKPiA+ID4gPiAgICAqbmV3ZXIqIHNlcXVlbmNlIG51bWJlciBmcm9t
IGEgc2hhbGxvd2VyIChpLmUuICJzb21lIENQVSBiZWNhbWUKPiA+ID4gPiAgICBhY3RpdmUgYWdh
aW4iKSByZXF1ZXN0IGhhcyBiZWVuIG9ic2VydmVkIGZvciB0aGUgc2FtZSBkb21haW4gc2luY2Uu
Cj4gPiA+ID4gICAgVGhpcyBpcyBhIGZpcm13YXJlLXNpZGUgc3RhbGVuZXNzIGNoZWNrLCBlbnRp
cmVseSBiZWxvdyB0aGUgU0JJCj4gPiA+ID4gICAgY2FsbCBib3VuZGFyeQo+ID4gPiA+ICAgIHRo
aXMgc2VxIG51bWJlciBjYW4gYmUgbWFpbnRhaW5lZCBpbiBnZW5kcGQgZ2VuZXJpYyBjb2RlCj4g
PiA+ID4gICAgb3IgcmlzY3YgcG93ZXJfb2ZmKCkgY2FsbGJhY2ssIHdoZXJlIGRvIHlvdSBzdWdn
ZXN0IHRoaXMgdG8gYmUKPiA+ID4gPiAgICBhZGRlZD8KPiA+ID4gPgo+ID4gPiA+IERvIHlvdSBo
YXZlIGFueSBzdWdnZXN0aW9uIHRvIHNvbHZpbmcgdGhpcyBpc3N1ZT8KPiA+ID4gPiBUaGFua3Ms
Cj4gPiA+ID4gSmltbXkgSG8KPiA+Cj4gPiBUaGUgcHJvYmxlbSBzZWVtcyB2ZXJ5IHNpbWlsYXIg
dG8gdGhlIHJhY2UgY29uZGl0aW9uIHdlIGhhdmUgZm9yIHRoZQo+ID4gUFNDSSBPU0kgbW9kZS4g
VGhpcyByYWNlIGNvbmRpdGlvbiBuZWVkcyB0byBiZSBtYW5hZ2VkIGluIHRoZSBGVy4KPiA+Cj4g
PiBJZiB0aGUgbGFzdCBDUFUgaW4gYSBjbHVzdGVyIGlzIGFib3V0IHRvIGVudGVyIGlkbGUsIHRo
ZSBGVyBzaW1wbHkKPiA+IG5lZWRzIHRvIGFib3J0IHRoZSByZXF1ZXN0IGZvciBpdCwgaWYgdGhl
cmUgaXMgYW5vdGhlciBDUFUgaW4gdGhlIHNhbWUKPiA+IGNsdXN0ZXIgdGhhdCBpcyBhYm91dCB0
byB3YWtlIHVwLgo+ID4KPiA+IEtpbmQgcmVnYXJkcwo+ID4gVWZmZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
